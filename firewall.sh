#!/bin/bash

# Włącz firewall
sudo ufw enable

# Blokuj wszystkie przychodzące połączenia
sudo ufw default deny incoming

# Pozwól na połączenia SSH (port 22)
sudo ufw allow 22

# Pozwól na połączenia HTTP (port 80)
sudo ufw allow 80

# Pozwól na połączenia HTTPS (port 443)
sudo ufw allow 443

# Włącz firewall
sudo ufw --force enable

# Wyświetl stan firewalla
sudo ufw status

