#!/bin/bash

apt-get -y install nginx

systemctl enable nginx.service
systemctl restart nginx
