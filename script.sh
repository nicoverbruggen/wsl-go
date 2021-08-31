#!/bin/bash
set -euo pipefail

echo "==================================================================="
echo "This will set up your WSL for PHP 8.0 & composer (as well as nginx)!"
echo "Installing PHP repository..."
echo "==================================================================="
echo ""

add-apt-repository -y ppa:ondrej/php
sudo apt update -y
sudo apt upgrade -y

echo ""
echo "==================================================================="
echo "Installing PHP dependencies..."
echo "==================================================================="
echo ""
apt install -y ncdu curl git nginx zip php8.0 php8.0-imagick php8.0-gd php8.0-xml php8.0-mbstring php8.0-zip php8.0-mysql php8.0-sqlite3
apt-get update && apt-get install php8.0-fpm -y

echo ""
echo "============================"
echo "Setting up composer..."
echo "============================"
echo ""

curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/bin --filename=composer

echo ""
echo "============================"
echo "Install node 16.x"
echo "============================"
echo ""

apt-get install -y software-properties-common
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install -y nodejs

# Ensure apache2 is removed (we're using nginx)
apt remove apache2 -y
apt autoremove -y

echo ""
echo "==================================================================="
echo "WSL has been provisioned. Ready to rumble. Here's your .ini config:"
echo "==================================================================="
echo ""
php --info | grep ini
