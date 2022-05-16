#! /bin/bash
    sudo apt-get update
    sudo apt-get install git nginx -y
    sudo service nginx restart
    sudo rm -R /var/www/html/*
    sudo git clone https://github.com/vitorfaustino/eshop-fe-demo.git /var/www/html