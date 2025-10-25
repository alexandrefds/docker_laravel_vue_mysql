FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
  nginx \
  supervisor \
  git \
  unzip \
  libpng-dev \
  libonig-dev \
  curl \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx-site.conf.template /etc/nginx/nginx-site.conf.template
COPY ./clone.sh /clone/clone.sh
RUN chmod +x /clone/clone.sh

ENV APP_DIR=/src/imob

ENTRYPOINT ["/clone/clone.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
