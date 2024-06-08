FROM php:7.4-apache

# 步骤 1: 更新软件包列表
RUN apt-get update
# 步骤 2: 安装 curl 软件包
RUN apt-get install -y curl
# 步骤 3: 安装 PHP curl 扩展
# RUN docker-php-ext-install curl

# 设置工作目录
WORKDIR /var/www/html

# 创建 src 文件夹
RUN mkdir src

# 复制文件到容器
COPY src/video_spider.php /var/www/html/src/
COPY index.php /var/www/html/
COPY .htaccess /var/www/html/

# 设置入口文件
CMD ["apache2-foreground"]
