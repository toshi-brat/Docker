# syntax=docker/dockerfile:1
FROM ubuntu
RUN apt update && apt install nginx -y
RUN mkdir -p /var/www/html/new-site.conf
COPY index.html /var/www/html/new-site.conf
COPY new-site.conf /etc/nginc/sites-enabled
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


