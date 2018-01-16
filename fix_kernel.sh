#!/bin/bash
sudo sed -ie 's/^UPDATEDEFAULT=.*/UPDATEDEFAULT=no/' /etc/sysconfig/kernel
sudo rm -f /boot/*rescue*
sudo sed -ie 's/^installonly_limit=.*/installonly_limit=2/' /etc/dnf/dnf.conf
