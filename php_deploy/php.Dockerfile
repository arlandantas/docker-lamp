FROM php:7.4-cli-alpine3.11

# Config PHP
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install
RUN apk update && \
  apk add --no-cache \
  # MySQL Client
  mariadb-client \
  # SSH Server
  openssh \
  # Git Client
  git

# Clear apk cache
RUN rm -rf /var/cache/apk/

# Install PHP MySQL drivers
RUN docker-php-ext-install mysqli pdo_mysql

# Create user suporte and set his password 123
RUN adduser -D suporte \
  && echo suporte:123 | chpasswd
# Add this user to root group
RUN addgroup suporte root

# Generate keys for SSH
RUN ssh-keygen -A

# Go to source path
WORKDIR /usr/src/

# Copy .env file
COPY .env ./
# RUN source '.env'

# Copy wait-for file
COPY wait-for.sh ./

# Copy and run install file
COPY install.sh ./
RUN (source .env && sh install.sh)

# Copy and execute init file
COPY init.sh ./
CMD [ "sh", "init.sh" ]