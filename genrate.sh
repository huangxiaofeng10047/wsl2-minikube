#!/bin/bash

# 在该目录下操作生成证书，正好供harbor.yml使用
# mkdir -p /data/cert
# cd /data/cert

openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=k8s2.local" -key ca.key -out ca.crt
openssl genrsa -out k8s2.local.key 4096
openssl req -sha512 -new -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=k8s2.local" -key k8s2.local.key -out k8s2.local.csr

cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=k8s2.local
DNS.2=harbor
DNS.3=ks-allinone
EOF

openssl x509 -req -sha512 -days 3650 -extfile v3.ext -CA ca.crt -CAkey ca.key -CAcreateserial -in k8s2.local.csr -out k8s2.local.crt
    
openssl x509 -inform PEM -in k8s2.local.crt -out k8s2.local.cert

# cp k8s2.local.crt /etc/pki/ca-trust/source/anchors/k8s2.local.crt 
# update-ca-trust
