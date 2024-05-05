FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -0 /var/www/html/master.zip -L https://github.com/deepeshmlgupta/2048.git
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

EXPOSE 80

CMD [ "/USR/SBIN/nginx", "-C", "/ETC/nginx/nginx.com" ]