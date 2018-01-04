echo "realtime-scheduling = no" >> /etc/pulse/daemon.conf
mkdir -p /usr/share/alsa/ucm/chtrt5645

wget -O /usr/share/alsa/ucm/chtrt5645/HiFi.conf https://raw.githubusercontent.com/plbossart/UCM/master/chtrt5645/HiFi.conf
wget -O /usr/share/alsa/ucm/chtrt5645/chtrt5645.conf https://raw.githubusercontent.com/plbossart/UCM/master/chtrt5645/chtrt5645.conf
