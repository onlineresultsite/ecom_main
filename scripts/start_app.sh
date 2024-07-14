#!/bin/bash

# Update the settings.py file
sed -i 's/\[]/\["13.53.132.185"]/' /home/ubuntu/ecom_main/ecom/settings.py

cd /home/ubuntu/ecom_main
source /home/ubuntu/env/bin/activate

python manage.py migrate 
python manage.py makemigrations     
python manage.py collectstatic --noinput
python manage.py runserver 0.0.0.0:8000
sudo service gunicorn restart
sudo service nginx restart
python manage.py runserver 0.0.0.0:8000
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
#systemctl restart gunicorn

