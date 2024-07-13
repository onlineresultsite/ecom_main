#!/bin/bash

# Update the settings.py file
sed -i 's/\[]/\["13.53.132.185"]/' /home/ubuntu/ecom_main/ecom/settings.py

# Navigate to the directory containing manage.py
cd /home/ubuntu/ecom_main/

# Check if manage.py exists
if [ ! -f manage.py ]; then
    echo "manage.py not found in /home/ubuntu/ecom_main/"
    exit 1
fi

# Activate virtual environment
source /home/ubuntu/env/bin/activate

# Run Django management commands
cd /home/ubuntu/ecom_main/
python3 manage.py migrate
cd /home/ubuntu/ecom_main/
python3 manage.py makemigrations
cd /home/ubuntu/ecom_main/
python3 manage.py collectstatic --noinput
cd /home/ubuntu/ecom_main/
# Restart Gunicorn and Nginx services
sudo service gunicorn restart
cd /home/ubuntu/ecom_main/
sudo service nginx restart
cd /home/ubuntu/ecom_main/
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

