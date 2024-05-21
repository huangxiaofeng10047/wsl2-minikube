安装pulsar
```
helm repo add apache https://pulsar.apache.org/charts
helm repo update
```
新增一个目录，注意需要是非git的目录
```
git clone https://github.com/apache/pulsar-helm-chart 
cd pulsar-helm-chart
```
运行脚本，生成pulsar密码
```
./scripts/pulsar/prepare_helm_release.sh -n pulsar-on-k8s -k pulsar-on-k8s -c
```
Helm 安装 Pulsar

执行以下命令进行 Pulsar 部署
```
helm install pulsar apache/pulsar \
    --timeout 10m \
    --set initialize=true \
    --set namespace=pulsar-on-k8s \
    --set volumes.local_storage=false \
    --set affinity.anti_affinity=false


helm install pulsar apache/pulsar \
    --set initialize=true \
    --namespace pulsar-on-k8s \
    --set volumes.local_storage=false \
    --values examples/values-minikube.yaml    
```
 helm uninstall pulsar -n pulsar-on-k8s 

确认运行情况，由于 charts 中几个 services 默认都为 LoadBalancer，所以会一直处于 pending 状态。
$ kc get pods -n pulsar-on-k8s

```
mkdir -p ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/completions
chmod -R 755 ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/completions
% ln -s ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/kubectl/kubectl.plugin.zsh ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/completions/_kubectl

we can do better


 yay -S kubectx
warning: config file /etc/pacman.conf, line 19: directive 'SyncFirst' in section 'options' not recognized.
resolving dependencies...
looking for conflicting packages...

Packages (1) kubectx-0.9.4-1

Total Download Size:   0.01 MiB
Total Installed Size:  0.01 MiB

:: Proceed with installation? [Y/n] y
:: Retrieving packages...
 kubectx-0.9.4-1-any      6.2 KiB  20.1 KiB/s 00:00 [###########################] 100%
(1/1) checking keys in keyring                      [###########################] 100%
(1/1) checking package integrity                    [###########################] 100%
(1/1) loading package files                         [###########################] 100%
(1/1) checking for file conflicts                   [###########################] 100%
(1/1) checking available disk space                 [###########################] 100%
:: Processing package changes...
(1/1) installing kubectx                            [###########################] 100%
:: Running post-transaction hooks...
(1/1) Arming ConditionNeedsUpdate...

~/workspace/tools/wsl2-minikube/pulsar-helm-chart master 1m 0s
❯ kubectx                          
minikube

~/workspace/tools/wsl2-minikube/pulsar-helm-chart master
❯ kubectx -
error: No previous context found.

~/workspace/tools/wsl2-minikube/pulsar-helm-chart master
❯ kubens   
default
kube-node-lease
kube-public
kube-system
kubernetes-dashboard
pulsar-on-k8s
```


遇到404
进行了pulsar-manager的重新编译
```
#创建用户：
CSRF_TOKEN=$(curl http://localhost:7750/pulsar-manager/csrf-token)
curl \
   -H 'X-XSRF-TOKEN: $CSRF_TOKEN' \
   -H 'Cookie: XSRF-TOKEN=$CSRF_TOKEN;' \
   -H "Content-Type: application/json" \
   -X PUT http://localhost:7750/pulsar-manager/users/superuser \
   -d '{"name": "admin", "password": "apachepulsar", "description": "test", 
        "email": "username@test.org"}'
```
通过k9s 则可以进行登录了。

