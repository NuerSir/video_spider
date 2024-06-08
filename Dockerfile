FROM erseco/alpine-php-webserver

# 更新 Alpine 软件包索引
USER root
RUN apk update --no-cache
# 安装 curl 软件包
RUN apk add --no-cache curl

USER nobody

# 设置工作目录
WORKDIR /var/www/html

# 创建 src 文件夹
RUN mkdir src

# 复制文件到容器
COPY src/video_spider.php /var/www/html/src/
COPY index.php /var/www/html/

# 设置入口文件
# CMD ["nginx", "-g", "daemon off;"]
