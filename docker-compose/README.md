# run ArkID by docker-compose

1. 按提示修改 .env 文件、settings_local.py 文件

2. $> docker-compose up -d

3. 打开 http://localhost:8989 (具体端口视 .env 中 HTTP_PORT 而定)，以内置账号 admin / admin 登录。


TODO: 连接mysql报错，暂时用 sqlite
