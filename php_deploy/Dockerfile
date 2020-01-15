FROM alpine:3.11
LABEL maintainer="Arlan Dantas<arlanjose@gmail.com>"
ENV TIMEZONE America/Santiago

RUN apk add openssh && rm -rf /var/cache/apk/

RUN adduser -D -S -H -h / ipsuporte \
  && echo ipsuporte:123 | chpasswd

# RUN usermod -aG sudo ipsuporte
RUN addgroup ipsuporte root

RUN ssh-keygen -A
# RUN /usr/sbin/sshd

EXPOSE 80
EXPOSE 22

# CMD [ "/usr/sbin/sshd", "-D" ]
CMD [ "sh" ]