rm -rf ~/.minikube
#clean minikube 
minikube delete
#clean docker
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)
#clean kubernetes
kubectl delete all --all
kubectl delete pvc --all
kubectl delete pv --all
kubectl delete secret --all
kubectl delete configmap --all
kubectl delete serviceaccount --all
kubectl delete role --all
kubectl delete rolebinding --all
kubectl delete clusterrole --all
kubectl delete clusterrolebinding --all
kubectl delete crd --all
kubectl delete apiservice --all
kubectl delete mutatingwebhookconfiguration --all
kubectl delete validatingwebhookconfiguration --all
kubectl delete customresourcedefinition --all
#编写k8s crd