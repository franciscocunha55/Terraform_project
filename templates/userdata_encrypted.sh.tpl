#! /bin/bash
    echo "<h1>Welcome to my encrypted web server</h1> Internal IP:" > /var/www/html/index.nginx-debian.html
    curl http://169.254.169.254/latest/meta-data/local-ipv4 >> /var/www/html/index.nginx-debian.html
    cat index.nginx-debian.html > index.html
    service nginx restart