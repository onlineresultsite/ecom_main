#!/bin/bash

# Update the settings.py file
sed -i 's/\[]/\["13.53.132.185"]/' /home/ubuntu/ecom_main/ecom/settings.py

cd /home/ubuntu/ecom_main
source /home/ubuntu/env/bin/activate

python3 manage.py migrate 
python3 manage.py makemigrations     
python3 manage.py collectstatic --noinput
sudo service gunicorn restart
sudo service nginx restart
cd /home/ubuntu/ecom_main
python3 manage.py runserver 0.0.0.0:8000
#sudo tail -f /var/log/nginx/error.log
#sudo systemctl reload nginx
#sudo tail -f /var/log/nginx/error.log
#sudo nginx -t
#sudo systemctl restart gunicorn
#sudo systemctl status gunicorn
#sudo systemctl status nginx
# Check the status
#systemctl status gunicorn
# Restart:


