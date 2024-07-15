#!/bin/sh

ssh root@172.31.47.46 <<EOF
  cd ecom_main
  git pull 
  source env/bin/activate
  ./manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF