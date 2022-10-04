# syntax=docker/dockerfile:1
FROM ubuntu
RUN apt update && apt install nginx -y
CMD ["bash"]
EXPOSE 80

