#!/usr/bin/bash 

# Update the settings.py file
sed -i 's/\[]/\["13.53.132.185"]/' /home/ubuntu/ecom_main/ecom/settings.py

# Navigate to the directory containing manage.py
cd /home/ubuntu/ecom_main/

# Run Django management commands
python3 manage.py migrate
python3 manage.py makemigrations
python3 manage.py collectstatic --noinput

# Restart Gunicorn and Nginx services
sudo service gunicorn restart
sudo service nginx restart

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

