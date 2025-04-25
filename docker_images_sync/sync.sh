#!/bin/bash
GREEN_COL="\\033[32;1m"
RED_COL="\\033[1;31m"
NORMAL_COL="\\033[0;39m"
SOURCE_REGISTRY=$1
TARGET_REGISTRY=$2
IMAGES_DIR=$2
: ${IMAGES_DIR:="images"}
#registry.k8s.io-images-registry_k8s.txt
# ghcr.io ghcro-mages.txt
# docker.io docker_io.txt
: ${IMAGES_LIST_FILE:="images-list.txt"}
: ${TARGET_REGISTRY:="10.7.20.12:5000"}
# registry.k8s.io
: ${SOURCE_REGISTRY:="docker.io"}
BLOBS_PATH="docker/registry/v2/blobs/sha256"
REPO_PATH="docker/registry/v2/repositories"
set -eo pipefail
CURRENT_NUM=0
ALL_IMAGES="$(sed -n '/#/d;s/:/:/p' ${IMAGES_LIST_FILE} | sort -u)"
TOTAL_NUMS=$(echo "${ALL_IMAGES}" | wc -l)
skopeo_sync() {
 if skopeo sync --insecure-policy --src-tls-verify=false --dest-tls-verify=false \
 --override-arch amd64 --override-os linux --src docker --dest dir $1 $2 > /dev/null; then
 echo -e "$GREEN_COL Progress: ${CURRENT_NUM}/${TOTAL_NUMS} sync $1 to $2 successful $NORMAL_COL"
 else
 echo -e "$RED_COL Progress: ${CURRENT_NUM}/${TOTAL_NUMS} sync $1 to $2 failed $NORMAL_COL"
 exit 2
 fi
}
if [ -d $IMAGES_DIR ];then
  rm -rf $IMAGES_DIR
fi
mkdir -p $IMAGES_DIR
convert_images() {
 rm -rf ${IMAGES_DIR}; mkdir -p ${IMAGES_DIR}
 for image in ${ALL_IMAGES}; do
 let CURRENT_NUM=${CURRENT_NUM}+1
 image_name=${image%%:*}
 image_tag=${image##*:}
 image_repo=${image%%/*}
 skopeo_sync ${SOURCE_REGISTRY}/${image} ${IMAGES_DIR}/${image_repo}
 manifest="${IMAGES_DIR}/${image}/manifest.json"
 manifest_sha256=$(sha256sum ${manifest} | awk '{print $1}')
 mkdir -p ${BLOBS_PATH}/${manifest_sha256:0:2}/${manifest_sha256}
 ln -f ${manifest} ${BLOBS_PATH}/${manifest_sha256:0:2}/${manifest_sha256}/data
 # make image repositories dir
 mkdir -p ${REPO_PATH}/${image_name}/{_uploads,_layers,_manifests}
 mkdir -p ${REPO_PATH}/${image_name}/_manifests/revisions/sha256/${manifest_sha256}
 mkdir -p ${REPO_PATH}/${image_name}/_manifests/tags/${image_tag}/{current,index/sha256}
 mkdir -p ${REPO_PATH}/${image_name}/_manifests/tags/${image_tag}/index/sha256/${manifest_sha256}
 # create image tag manifest link file
 echo -n "sha256:${manifest_sha256}" > ${REPO_PATH}/${image_name}/_manifests/tags/${image_tag}/current/link
 echo -n "sha256:${manifest_sha256}" > ${REPO_PATH}/${image_name}/_manifests/revisions/sha256/${manifest_sha256}/link
 echo -n "sha256:${manifest_sha256}" > ${REPO_PATH}/${image_name}/_manifests/tags/${image_tag}/index/sha256/${manifest_sha256}/link
 # link image layers file to registry blobs dir
 for layer in $(sed '/v1Compatibility/d' ${manifest} | grep -Eo "\b[a-f0-9]{64}\b"); do
 mkdir -p ${BLOBS_PATH}/${layer:0:2}/${layer}
 mkdir -p ${REPO_PATH}/${image_name}/_layers/sha256/${layer}
 echo -n "sha256:${layer}" > ${REPO_PATH}/${image_name}/_layers/sha256/${layer}/link
 ln -f ${IMAGES_DIR}/${image}/${layer} ${BLOBS_PATH}/${layer:0:2}/${layer}/data
 done
 done
}

convert_images
