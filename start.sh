echo -n "Starting Kubernetes..."
minikube version
minikube config set WantUpdateNotification false
minikube delete && minikube start --memory=8096 --cpus=6   --insecure-registry "10.7.20.12:5000" 
sleep 2
n=0
until [ $n -ge 10 ]
do
   minikube addons enable dashboard && break
   minikube addons enable metrics-server && break
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
