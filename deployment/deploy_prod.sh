#!/bin/sh

ssh root@16.171.141.26 <<EOF
  cd /home/ubuntu/ecom_main
  git pull 
  source /home/ubuntu/ecom_main/env/bin/activate
  python3 /home/ubuntu/ecom_main/manage.py migrate
  sudo systemctl restart gunicorn
  sudo systemctl restart nginx
  exit
EOF
