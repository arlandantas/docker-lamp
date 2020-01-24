#!/bin/sh
cd /usr/src/
source .env

# Initialize SSH Server
/usr/sbin/sshd
echo "SSH started!"

# Wait for MySQL Server
echo "Waiting MySQL..."
sh /usr/src/wait-for.sh db:3306
echo "MySQL available!"

# Open source root directory
cd /usr/src/app

# Check if isset $init_sh
if [ ! -z "${init_sh}" ]
then
    # Execute him
    sh $init_sh
else
    # Check if isset $php_root
    if [ ! -z "${php_root}" ]
    then
        # Open this directory
        cd $php_root
    fi
    # Starts http server at port 80
    php -S 0.0.0.0:80
fi