# Purpose
This repo was originally intended to show the numerous issues one was faced with when trying to use WSL2 with `minikube`.

Now, after several years and countless hours of testing to get issues worked out, it finally looks like WSL/WSL2 is usable for development (for my use case). Much appreciation to the developers of WSL2 and `minikube`. I've actually deleted my Linux partition and started using WSL2 full-time.

My use case is the following stack:
- `docker` running in WSL2 and not Docker Desktop for Windows
- `kubectl`
- `minikube`
- `skaffold`
- `mkcert` for local development TLS certificates

I'm repurposing this repo to demonstrate how to get this stack up and running in WSL2.

For the `mkcert` implementation, please see [this repo](https://github.com/cheslijones/tls-minikube).

9/11/21 Update - It seems like this wasn't working properly so I fixed the issue.

11/30/21 Update - Clarified a few steps related to `docker` and `sudo`, and where `kubectl`, `minikube`, and `skaffold` should be installed (WSL2).

# Setup

Assuming WSL2 is already enabled and using WSL2 Ubuntu 20.04 LTS is already installed.

Refer to the documentation below for the latest installation processes.

1. `git clone https://github.com/cheslijones/wsl2-minikube.git`

2. `cd wsl2-minikube`

3. [Install `docker`](https://docs.docker.com/engine/install/ubuntu/) directly into WSL2:

   Run the following command so you don't have to use `sudo` for `docker` commands:
   ```
   sudo usermod -aG docker $USER
   ```
   Then close and reopen WSL2, restart the Lxss service, or sign in and out of Windows... which ever works. 
   
   Of course, every time you boot up Windows you need to start `docker` in WSL2 with:
   ```
   sudo service docker start
   ```

4. [Install `kubectl` for Linux in WSL2](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)


5. [Install `minikube` for Linux in WSL2](https://minikube.sigs.k8s.io/docs/start/):
    
    Go ahead and create a cluster while we are here. 
    ```
    minikube start --vm-driver=docker
    ```
    It should spin up in about a minute. 

6. [Install `skaffold` for Linux in WSL2](https://skaffold.dev/docs/install/)

7. [Install / enable `ingress-nginx`](https://kubernetes.github.io/ingress-nginx/deploy/):

    It is a bit counter-intuitive, but using the Docker for Mac instructions works not only with Docker Desktop for Windows and macOS, but also WSL2:
    ```    
    minikube update-context
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/cloud/deploy.yaml
    ```

8. Run `skaffold dev`.
9. In another terminal, run `minikube tunnel` which should prompt you for `sudo` credentials:

    ```
    $ minikube tunnel
    ❗  The service ingress-nginx-controller requires privileged ports to be exposed: [80 443]
    🔑  sudo permission will be asked for it.
    🏃  Starting tunnel for service ingress-nginx-controller.
    [sudo] password for cheslijones: 
    ```

10. Open your preferred browser and navigate to `localhost`. 

    You should see:

    [<img src="https://assets.digitalocean.com/articles/66983/React_template_project.png">](https://assets.digitalocean.com/articles/66983/React_template_project.png)

    If not:

    - Make sure `docker` is running (`sudo service docker start`).
    - Make sure your `minikube` cluster is running with `minikube start`.


# Questions, Issues and Feedback
Please create an issue if you have any questions, issues running the repo, or have feedback on how I can improve this repo or correct something that is wrong. I'm always looking for ways to improve.

minikube update
wget https://github.com/kubernetes/minikube/releases/download/v1.31.1/minikube-linux-amd64
参考文档：
https://docs.k8ssandra.io/tasks/connect/ingress/minikube-deployment/
helm upgrade traefik traefik/traefik -n traefik --create-namespace -f traefik-values.yaml

卸载traefik试试
helm uninstall traefik traefik/traefik -n traefik
🌈 kubectl port-forward --namespace traefik services/traefik 9000:9000
kubectl apply -f ingress-k8s-dashboard.yaml


tls 导入证书：
kubectl create secret tls mytls --cert=k8s/server.crt --key=k8s/server.key -n traefik
生成证书：
mkdir cert-k8s2local
cd cert-k8s2local
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=k8s.local"
kubectl -n kubernetes-dashboard   create secret tls k8s2local1 --key=k8s2.local.key --cert=k8s2.local.crt
部署kubegems
export KUBEGEMS_VERSION=v1.23.12 
kubectl create namespace kubegems-installer
kubectl apply -f https://github.com/kubegems/kubegems/raw/${KUBEGEMS_VERSION}/deploy/installer.yaml
deploy local-path
kubectl create namespace local-path-storage
kubectl apply -f https://github.com/kubegems/kubegems/raw/${KUBEGEMS_VERSION}/deploy/addon-local-path-provisioner.yaml


 kubectl create namespace kubegems

 export STORAGE_CLASS=local-path  # 改为您使用的 storageClass
 export IMAGE_REGISTY=registry.cn-beijing.aliyuncs.com
curl -sL https://github.com/kubegems/kubegems/raw/${KUBEGEMS_VERSION}/deploy/kubegems.yaml \
| sed -e "s/local-path/${STORAGE_CLASS}/g" -e "s/docker.io/${IMAGE_REGISTY}/g" \
> kubegems.yaml

 kubectl apply -f kubegems.yaml
 卸载prometehus命令
 kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
