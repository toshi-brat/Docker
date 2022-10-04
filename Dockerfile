# syntax=docker/dockerfile:1
FROM ubuntu
RUN apt update && apt install nginx -y
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


