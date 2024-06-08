FROM php:7.4-apache

# 安装curl扩展
RUN apt-get update && apt-get install -y curl \
    && docker-php-ext-install curl

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
