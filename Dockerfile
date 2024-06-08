FROM erseco/alpine-php-webserver:3.19.1

# 安装 curl 软件包和 PHP curl 扩展
RUN apk update
RUN apk add --no-cache curl
RUN docker-php-ext-install curl

# 设置工作目录
WORKDIR /var/www/html

# 创建 src 文件夹
RUN mkdir src

# 复制文件到容器
COPY src/video_spider.php /var/www/html/src/
COPY index.php /var/www/html/

# 设置入口文件
CMD ["nginx", "-g", "daemon off;"]
