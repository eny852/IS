#!/bin/bash

dnf -y install httpd

systemctl enable httpd.service

systemctl restart httpd.service
