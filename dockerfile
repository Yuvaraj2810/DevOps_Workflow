FROM ubuntu:latest
RUN apt-get update && apt-get install -y apache zip unzip wget
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page287/eflyer.zip
RUN unzip eflyer.zip
RUN cp -rvf eflyer/* .
RUN rm -rf eflyer eflyer.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
