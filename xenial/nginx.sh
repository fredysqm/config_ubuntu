#!/bin/sh

###############################################################################
##### NGINX ###################################################################
###############################################################################

##### PARAMETROS ##############################################################
read -p "ip principal: " MY_IP

##### NGINX ###################################################################
apt -y install nginx
systemctl stop nginx
cp ./tmpl/nginx/nginx.conf /etc/nginx/
cp ./tmpl/nginx/global.d/custom.conf /etc/nginx/global.d/
cp ./tmpl/nginx/sites-available/default /etc/nginx/sites-available/
cp ./tmpl/nginx/sites-available/default-ssl /etc/nginx/sites-available/
cp ./tmpl/nginx/sites-available/redirect /etc/nginx/sites-available/
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/redirect /etc/nginx/sites-enabled/
systemctl start nginx

##### ROOT UTILS ##############################################################
mkdir /root/bin/
mkdir /root/tmpl/
cp ./tmpl/nginx/root/bin/create_user /root/bin/
cp ./tmpl/nginx/root/bin/delete_user /root/bin/
cp ./tmpl/nginx/root/tmpl/vhost.conf /root/tmpl/
chmod 500 /root/bin/*
chmod 400 /root/tmpl/*
#EOF
