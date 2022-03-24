#!/bin/bash
set -euo pipefail

echo "==================================================================="
echo "This will set up your WSL for PHP 8.1 & composer (as well as nginx)!"
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
apt install -y ncdu curl git nginx zip php8.1 php8.1-imagick php8.1-gd php8.1-xml php8.1-mbstring php8.1-zip php8.1-mysql php8.1-sqlite3 php8.1-curl
apt-get update -y
apt-get install php8.1-fpm -y

echo ""
echo "============================"
echo "Setting up Composer..."
echo "============================"
echo ""

curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/bin --filename=composer

echo ""
echo "============================"
echo "Install Node.js 16.x"
echo "============================"
echo ""

apt-get install -y software-properties-common
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install -y nodejs

# Ensure Apache is removed (we'll be using nginx)
apt remove apache2 -y
apt autoremove -y

echo ""
echo "==================================================================="
echo "WSL has been provisioned. Ready to rumble. Here's your .ini config:"
echo "==================================================================="
echo ""
php --info | grep ini
