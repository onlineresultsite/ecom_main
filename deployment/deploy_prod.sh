#!/bin/sh

ssh root@134.209.208.182 <<EOF
  cd ecom_main
  git pull 
  source env/bin/activate
  ./manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF