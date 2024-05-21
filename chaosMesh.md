强大的混沌工程平台
```
curl -sSL https://mirrors.chaos-mesh.org/v2.5.0/install.sh | bash

```
使用最新的脚本如下：
```
in: line 647: ((: 10#1.25.4 > 10#1.12.0: syntax error: invalid arithmetic operator (error token is ".25.4 > 10#1.12.0")
main: line 651: ((: 10#1.25.4 < 10#1.12.0: syntax error: invalid arithmetic operator (error token is ".25.4 < 10#1.12.0")
main: line 647: ((: 10#1.25.3 > 10#1.12.0: syntax error: invalid arithmetic operator (error token is ".25.3 > 10#1.12.0")
main: line 651: ((: 10#1.25.3 < 10#1.12.0: syntax error: invalid arithmetic operator (error token is ".25.3 < 10#1.12.0")
Install Chaos Mesh chaos-mesh
customresourcedefinition.apiextensions.k8s.io/awschaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/azurechaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/blockchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/dnschaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/gcpchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/httpchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/iochaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/jvmchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/kernelchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/networkchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/physicalmachinechaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/physicalmachines.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/podchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/podhttpchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/podiochaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/podnetworkchaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/remoteclusters.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/schedules.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/statuschecks.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/stresschaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/timechaos.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/workflownodes.chaos-mesh.org created
customresourcedefinition.apiextensions.k8s.io/workflows.chaos-mesh.org created
namespace/chaos-mesh created
serviceaccount/chaos-daemon created
serviceaccount/chaos-dashboard created
serviceaccount/chaos-controller-manager created
secret/chaos-mesh-webhook-certs created
clusterrole.rbac.authorization.k8s.io/chaos-mesh-chaos-dashboard-cluster-level created
clusterrole.rbac.authorization.k8s.io/chaos-mesh-chaos-dashboard-target-namespace created
clusterrole.rbac.authorization.k8s.io/chaos-mesh-chaos-controller-manager-target-namespace created
clusterrole.rbac.authorization.k8s.io/chaos-mesh-chaos-controller-manager-cluster-level created
clusterrolebinding.rbac.authorization.k8s.io/chaos-mesh-chaos-dashboard-cluster-level created
clusterrolebinding.rbac.authorization.k8s.io/chaos-mesh-chaos-dashboard-target-namespace created
clusterrolebinding.rbac.authorization.k8s.io/chaos-mesh-chaos-controller-manager-cluster-level created
clusterrolebinding.rbac.authorization.k8s.io/chaos-mesh-chaos-controller-manager-target-namespace created
role.rbac.authorization.k8s.io/chaos-mesh-chaos-controller-manager-control-plane created
rolebinding.rbac.authorization.k8s.io/chaos-mesh-chaos-controller-manager-control-plane created
service/chaos-daemon created
service/chaos-dashboard created
service/chaos-mesh-controller-manager created
daemonset.apps/chaos-daemon created
deployment.apps/chaos-dashboard created
deployment.apps/chaos-controller-manager created
mutatingwebhookconfiguration.admissionregistration.k8s.io/chaos-mesh-mutation created
validatingwebhookconfiguration.admissionregistration.k8s.io/chaos-mesh-validation created
validatingwebhookconfiguration.admissionregistration.k8s.io/chaos-mesh-validation-auth created
Waiting for pod running
chaos-controller-manager-67cdb7f6b6-9t88x   0/1   ContainerCreating   0     13s
chaos-controller-manager-67cdb7f6b6-c5wxs   0/1   ContainerCreating   0     13s
chaos-controller-manager-67cdb7f6b6-mgxrl   0/1   ContainerCreating   0     13s
Waiting for pod running
chaos-controller-manager-67cdb7f6b6-9t88x   0/1   ContainerCreating   0     24s
chaos-controller-manager-67cdb7f6b6-c5wxs   0/1   ContainerCreating   0     24s
chaos-controller-manager-67cdb7f6b6-mgxrl   0/1   ContainerCreating   0     24s
Waiting for pod running
chaos-controller-manager-67cdb7f6b6-9t88x   0/1   ContainerCreating   0     35s
chaos-controller-manager-67cdb7f6b6-c5wxs   0/1   ContainerCreating   0     35s
chaos-controller-manager-67cdb7f6b6-mgxrl   0/1   ContainerCreating   0     35s
Waiting for pod running
chaos-controller-manager-67cdb7f6b6-9t88x   0/1   ContainerCreating   0     47s
chaos-controller-manager-67cdb7f6b6-c5wxs   0/1   ContainerCreating   0     47s
chaos-controller-manager-67cdb7f6b6-mgxrl   0/1   ContainerCreating   0     47s
Waiting for pod running

```