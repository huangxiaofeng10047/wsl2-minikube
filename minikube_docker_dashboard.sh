eval $(minikube docker-env)
skaffold dev
解绑 minikube docker-env
eval $(minikube docker-env -u)

