echo -n "Starting Kubernetes..."
minikube version
minikube start --memory=6192 --cpus=4  --insecure-registry "10.7.116.12:5000,10.7.20.51"   --image-mirror-country='cn'  
sleep 2
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
