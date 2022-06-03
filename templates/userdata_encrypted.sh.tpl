#! /bin/bash
    echo "<h1>Welcome to my encrypted web server</h1> Internal IP:" > /var/www/html/index.nginx-debian.html
    curl http://169.254.169.254/latest/meta-data/local-ipv4 >> /var/www/html/index.nginx-debian.html
    sudo cat /var/www/html/index.nginx-debian.html > /var/www/html/index.html
    sudo apt-get install awscli -y
    service nginx restart