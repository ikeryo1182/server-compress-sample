FROM httpd

COPY ./src /var/www/html
COPY ./config/httpd.conf /usr/local/apache2/conf/httpd.conf 

EXPOSE 80
