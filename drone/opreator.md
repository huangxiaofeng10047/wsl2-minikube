helm repo update
helm repo add drone https://charts.drone.io
helm repo update
# 获取最新的离线drone包
helm pull  stable/drone
tar xf drone-2.4.0.tgz && cd drone
# 编辑values.yaml
