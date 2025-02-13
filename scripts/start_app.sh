#!/bin/bash

# Update the settings.py file
sed -i 's/\[]/\["16.171.141.26"]/' /home/ubuntu/ecom_main/ecom/settings.py

cd /home/ubuntu/ecom_main
source /home/ubuntu/env/bin/activate
find /home/ubuntu -name "manage.py"

python3 manage.py migrate 
python3 manage.py makemigrations     
python3 manage.py collectstatic --noinput

sudo chown -R ubuntu:ubuntu /home/ubuntu/ecom_main/db.sqlite3
sudo chown -R ubuntu:ubuntu /home/ubuntu/ecom_main
sudo chmod 664 /home/ubuntu/ecom_main/db.sqlite3
sudo chmod 775 /home/ubuntu/ecom_main
sudo chmod 775 /home/ubuntu/ecom_main
ls -l /home/ubuntu/ecom_main/db.sqlite3

sudo service gunicorn restart
sudo service nginx restart


# python3 manage.py runserver 0.0.0.0:8000
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


