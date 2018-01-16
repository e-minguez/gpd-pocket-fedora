#!/bin/bash
sudo sed -ie 's/^UPDATEDEFAULT=.*/UPDATEDEFAULT=no/' /etc/sysconfig/kernel
sudo rm -f /boot/*rescue*
