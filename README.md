# ArkID

ArkID是全新一代企业单点登录解决方案, 彻底告别企业内多系统多账号的烦恼, 节省管理成本, 自带功能全面的WEB管理界面，提升管理效率。

## 项目说明

- [arkid-frontend](https://github.com/longguikeji/arkid-frontend): 前端代码
- [arkid](https://github.com/longguikeji/arkid): 后端代码
## 部署方式

### 1、docker-compose 方式部署
```shell
git clone https://github.com/longguikeji/arkid-charts.git

cd arkid-charts/docker-compose

docker-compose up -d
```
浏览器打开http://127.0.0.1:8989 探索 ArkID 的完整功能。

### 2、helm/charts 方式部署

#### Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

#### 安装CRD
```shell
CHARTCRD=`kubectl get crd|grep helmcharts.helm.cattle.io`
if [ -z "$CHARTCRD" ];then
    kubectl create -f https://gitee.com/longguikeji/arkid-charts/raw/main/helmchartscrd.yaml
fi
```

#### 部署arkid
```shell
kubectl create ns arkid
kubectl create -f https://gitee.com/longguikeji/arkid-charts/raw/main/arkid.yaml

```

#### 访问arkid
> 注意：首次访问时，确认访问地址之后就不能再更改了

- 通过port-forward
> 只能再试用时使用这种方式访问

```shell
> kubectl -n arkid port-forward svc/arkid-portal  8989:80
Forwarding from 127.0.0.1:8989 -> 80
Handling connection for 8989
```

浏览器打开http://127.0.0.1:8989 探索 ArkID 的完整功能。

- 通过nodeport 32580
> arkid默认会打开nodeport 32580
> http://某个nodeip:32580

- 通过ingress
> 查看chart/values.yaml 中的配置项，设置ingress
> kubectl -n arkid edit helmchart arkid