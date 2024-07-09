#!/bin/bash

# Update packages
apt-get update -y

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo system enable docker.service
sudo system enable containerd.service

# Install essential packages
# apt-get install -y nginx certbot python3-certbot-nginx

# # Create a directory for the SSL certificate
# mkdir -p /etc/ssl/lesanpi.dev


# # Create a directory for the web content
# mkdir -p /var/www/html
# # chown -R ec2-user:ec2-user /var/www/html

# # Create a basic HTML file (you can replace this with your actual content)
# echo '<!DOCTYPE html>
# <html>
# <head>
#     <title>¡Hola Mundo!</title>
# </head>
# <body>
#     <h1>¡Hola Mundo from Lesanpi.dev!</h1>
# </body>
# </html>' > /var/www/html/index.html

# # Configure Nginx with SSL - Fix listen directive and path to certificate files
# # echo 'server {
# #     listen 80;
# #     server_name lesanpi.dev www.lesanpi.dev;
# #     return 301 https://$host$request_uri;  # Redirect http to https
# # }

# # server {
# #     listen 443 http2;  # Listen on port 443 (standard for https)
# #     server_name lesanpi.dev www.lesanpi.dev;
# #     root /var/www/html;
# #     index index.html;
# # }
# # ' > /etc/nginx/sites-available/lesanpi.dev

# # Enable the website with HTTPS
# # ln -s /etc/nginx/sites-available/lesanpi.dev /etc/nginx/sites-enabled/lesanpi.dev

# # Restart Nginx
# systemctl restart nginx



# # Generate a Let's Encrypt SSL certificate
# # certbot certonly --nginx -d lesanpi.dev -d www.lesanpi.dev -m lespinerua@gmail.com --agree-tos

# # (Optional) Set up automatic renewal for the certificate (refer to Let's Encrypt documentation)
