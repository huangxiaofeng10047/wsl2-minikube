minikube config set memory 4096
minikube config set cpus 2
minikube delete
# minikube start   --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0 
# minikube ssh 'sudo ip link set docker0 promisc on'
# minikube dashboard
# minikube start --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers


minikube stop
minikube delete
# minikube start --kubernetes-version=v1.25.3 --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers  --extra-config=kubelet.cgroup-driver=systemd
# minikube start –-registry-mirror=https://registry.docker-cn.com –-image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers –vm-driver=docker –alsologtostderr -v=8 –-base-image registry.cn-hangzhou.aliyuncs.com/google_containers/kicbase:v0.0.10
minikube start --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers  --kubernetes-version=v1.25.3 --v=9
# minikube dashboard 
