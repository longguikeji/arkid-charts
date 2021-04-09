# ArkID

ArkID是全新一代企业单点登录解决方案, 彻底告别企业内多系统多账号的烦恼, 节省管理成本, 自带功能全面的WEB管理界面，提升管理效率。

## 项目说明

- [arkid-frontend](https://github.com/longguikeji/arkid-frontend): 前端代码
- [arkid](https://github.com/longguikeji/arkid): 后端代码
## 部署方式

### 1、docker-compose 方式部署
```shell
## arkid v2.0
git clone --branch v2-dev --depth 1  https://github.com/longguikeji/arkid-charts.git

cd arkid-charts/docker-compose

docker-compose up -d
```
浏览器打开http://127.0.0.1:8989 探索ArkID 2.0 的完整功能。

### 2、helm/charts 方式部署

#### Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

```shell
## arkid v2.0
git clone --branch v2-dev --depth 1  https://github.com/longguikeji/arkid-charts.git

cd arkid-charts/chart

helm install arkidv2 . \
--set persistence.init=true \
--set ingress.cert=false \
--set ingress.tls=false \
--set ingress.host.name=arkid.yourcompany.com
```


```shell
> kubectl port-forward svc/arkid-portal  8989:80
Forwarding from 127.0.0.1:8989 -> 80
Handling connection for 8989
```

浏览器打开http://127.0.0.1:8989 探索ArkID 2.0 的完整功能。