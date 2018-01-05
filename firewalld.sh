#!/bin/bash
sudo sed -i -e 's/CleanupOnExit=yes/CleanupOnExit=no/' /etc/firewalld/firewalld.conf
