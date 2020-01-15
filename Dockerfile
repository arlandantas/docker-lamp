FROM alpine:3.11
LABEL maintainer="Arlan Dantas<arlanjose@gmail.com>"
ENV TIMEZONE America/Santiago

COPY install.sh /install.sh
RUN chmod u+x /install.sh
RUN /install.sh

COPY git-shell-commands /home/git/git-shell-commands

# sshd_config file is edited for enable access key and disable access password
COPY sshd_config /etc/ssh/sshd_config
COPY start.sh start.sh

EXPOSE 80
EXPOSE 3306
EXPOSE 22

CMD [ "sh", "start.sh" ]