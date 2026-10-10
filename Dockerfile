FROM nginx:alpine

# Build-аргумент: имя хоста для CN сертификата
ARG APP_HOST=localhost

# Устанавливаем openssl (в alpine его нет по умолчанию)
RUN apk add --no-cache openssl

# Копируем статику
COPY index.html /usr/share/nginx/html/
COPY 404.html   /usr/share/nginx/html/
COPY style.css  /usr/share/nginx/html/
COPY script.js  /usr/share/nginx/html/

# Копируем скрипт генерации сертификата и запускаем его
COPY certs/generate.sh /tmp/generate.sh
RUN chmod +x /tmp/generate.sh && \
    mkdir -p /etc/nginx/ssl && \
    /tmp/generate.sh "$APP_HOST" /etc/nginx/ssl && \
    rm /tmp/generate.sh

# Свой конфиг nginx
COPY site.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
