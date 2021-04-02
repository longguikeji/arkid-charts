# ArkID

ArkID是全新一代企业单点登录解决方案, 彻底告别企业内多系统多账号的烦恼, 节省管理成本, 自带功能全面的WEB管理界面，提升管理效率。

## 项目说明

- [arkid-frontend](https://github.com/longguikeji/arkid-frontend): 前端代码
- [arkid](https://github.com/longguikeji/arkid-core): 后端核心以及其他
- [arkid-broker](https://github.com/longguikeji/arkid-broker): 一账通部署在ArkOS中的服务Broker

## 功能特性

### 兼容各种常见协议, 让每个应用都可以连接

1. LDAP
2. OAuth
3. OpenID(即将开放)
4. SAML(即将开放)
5. HTTP API

### 丰富的账号与分组管理

1. 灵活高效的管理企业内部账号与分组
2. 支持一键钉钉导入

### 完备的权限管理

细粒度的权限管理，让企业没有管理不到的权限

1. 账号权限
2. 分组权限
3. 应用白名单，黑名单
4. 应用内权限

### 工作台(Workspace)

每位员工均拥有自己的工作台，一键访问业务系统

### 自定义登陆UI

名称、LOGO、主题色，让登陆页面彰显企业文化



## 文档

- [接口文档](https://oneid1.docs.apiary.io/#)


## 部署方式

### 1、docker-compose 方式部署
```shell
## arkid v2.0
git clone --branch v2-dev --depth 1  https://github.com/longguikeji/arkid-charts.git

cd arkid-charts/docker-compose

docker-compose up -d
```

### 2、helm/charts 方式部署
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


## Contact

- [Website](https://www.longguikeji.com)
