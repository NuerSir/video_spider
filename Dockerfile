FROM php:7.4-cli

# 安装curl扩展
RUN apt-get update && apt-get install -y curl \
    && docker-php-ext-install curl

# 设置工作目录
WORKDIR /app

RUN mkdir src

# 复制文件到容器
COPY src/video_spider.php /app/src/
COPY index.php /app/

# 设置入口文件
CMD ["php", "index.php"]
