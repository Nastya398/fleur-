FROM nginx:alpine

# Копируем статику
COPY index.html /usr/share/nginx/html/
COPY 404.html   /usr/share/nginx/html/
COPY style.css  /usr/share/nginx/html/
COPY script.js  /usr/share/nginx/html/

# Свой конфиг nginx
COPY site.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
