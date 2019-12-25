FROM alpine:3.11
ENV TIMEZONE America/Santiago

COPY docker/instal.sh /instal.sh
RUN chmod u+x /instal.sh
RUN /install.sh

WORKDIR /var/www/localhost/htdocs/
RUN httpd

EXPOSE 80
EXPOSE 3306

ENTRYPOINT [ "/bin/sh" ]