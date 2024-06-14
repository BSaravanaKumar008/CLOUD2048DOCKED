FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y nginx zip curl \
    && rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf \
    && curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/master.zip \
    && cd /var/www/html/ \
    && unzip master.zip \
    && mv 2048-master/* . \
    && rm -rf 2048-master master.zip

EXPOSE 8000

CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf" ]
