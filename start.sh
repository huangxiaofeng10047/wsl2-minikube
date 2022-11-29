echo -n "Starting Kubernetes..."
export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24
minikube version
# minikube start --wait=false --image-repository='registry.cn-hangzhou.aliyuncs.com/google_containers'  --image-mirror-country='cn'
minikube start --driver=docker --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force   --image-mirror-country='cn'  --extra-config=kubelet.cgroup-driver=systemd --container-runtime='containerd'
sleep 2--extra-config=kubelet.cgroup-driver=systemd --image-mirror-country='cn' --registry-mirror=https://registry.docker-cn.com --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers --insecure-registry=harbor.k8s.local,registry.k8s.local --cpus='max' --container-runtime='containerd' --disk-size='50gb' --memory='8gb' --nfs-shares-root='/nfsshares' --nfs-share=/Volumes/data/DockerVolume
n=0
until [ $n -ge 10 ]
do
   minikube addons enable dashboard && break
   n=$[$n+1]
   sleep 1
done
sleep 1
n=0
until [ $n -ge 10 ]
do
   kubectl apply -f ./kubernetes-dashboard.yaml &>/dev/null  && break
   n=$[$n+1]
   sleep 1
done
echo "Kubernetes Started"
