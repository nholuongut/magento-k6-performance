#!/bin/bash
sudo gpg -k
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt-get update
sudo apt-get install k6
sudo apt-get install wget
wget https://raw.githubusercontent.com/Gnholuongut/magento-k6-performance/main/magento.js
echo "TEST GOOGLE.com"
k6 run magento.js -e url=https://www.google.com/ -u 1 -i 10 --include-system-env-vars=false
