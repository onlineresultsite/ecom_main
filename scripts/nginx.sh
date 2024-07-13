#!/usr/bin/bash

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Remove the default site configuration if it exists to prevent conflicts
sudo rm -f /etc/nginx/sites-enabled/default

# Copy the custom Nginx configuration to the sites-available directory
sudo cp /home/ubuntu/ecom_main/nginx/nginx.conf /etc/nginx/sites-available/ecom

# Remove any existing symbolic link to prevent duplicate entries
sudo rm -f /etc/nginx/sites-enabled/ecom

# Create a symbolic link from sites-available to sites-enabled
sudo ln -s /etc/nginx/sites-available/ecom /etc/nginx/sites-enabled/

# Add the www-data user to the ubuntu group (if needed)
sudo gpasswd -a www-data ubuntu

# Test Nginx configuration for syntax errors
sudo nginx -t

# Restart Nginx to apply changes
sudo systemctl restart nginx
