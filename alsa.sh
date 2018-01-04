#!/bin/bash
echo "realtime-scheduling = no" | sudo tee -a /etc/pulse/daemon.conf
sudo mkdir -p /usr/share/alsa/ucm/chtrt5645

sudo wget -O /usr/share/alsa/ucm/chtrt5645/HiFi.conf https://fedorapeople.org/~jwrdegoede/chtrt5645/HiFi.conf
sudo wget -O /usr/share/alsa/ucm/chtrt5645/chtrt5645.conf https://fedorapeople.org/~jwrdegoede/chtrt5645/chtrt5645.conf

exit 0

# This seems not needed...
echo "set-card-profile alsa_card.platform-cht-bsw-rt5645 HiFi" | sudo tee -a /etc/pulse/default.pa
sudo echo "set-default-sink alsa_output.platform-cht-bsw-rt5645.HiFi__hw_chtrt5645_0__sink" | sudo tee -a /etc/pulse/default.pa
echo "set-sink-port alsa_output.platform-cht-bsw-rt5645.HiFi__hw_chtrt5645_0__sink [Out] Speaker" | sudo tee -a /etc/pulse/default.pa
