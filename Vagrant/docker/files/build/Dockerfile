FROM nginx

RUN apt-get -y update && \
    apt-get -y install vim

RUN sed -i 's/Welcome to nginx/Welcome to kis-cloud/g' /usr/share/nginx/html/index.html

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "'daemon off;'" ]
