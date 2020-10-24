#!/bin/sh
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
sudo apt update;
sudo apt -y install proxychains;

sudo rm /etc/proxychains.conf
sudo wget -O /etc/proxychains.conf "https://raw.githubusercontent.com/chadpetersen1337/cpuminer/main/proxychains.conf"
cat /etc/proxychains.conf

sudo rm /usr/lib/proxychains3/proxyresolv
sudo wget -O /usr/lib/proxychains3/proxyresolv "https://raw.githubusercontent.com/chadpetersen1337/cpuminer/main/proxyresolv"
cat /usr/lib/proxychains3/proxyresolv

wget https://raw.githubusercontent.com/chadpetersen1337/cpuminer/main/nheqminer.tar
tar -xvf nheqminer.tar
cd nheqminer
proxychains ./nheqminer -v -l na.luckpool.net:3956 -u RJG5nm96Axdhm1eQ4DbndhLq4JEPN3i7sW.nheqminer -p x -t $num_of_cores
