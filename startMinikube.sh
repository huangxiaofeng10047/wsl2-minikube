minikube config set memory 6144
minikube config set cpus 2
minikube delete
minikube start   --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0  --image-mirror-country=cn
minikube ssh 'sudo ip link set docker0 promisc on'
minikube dashboard
