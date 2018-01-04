#!/bin/bash
sudo sed -ie 's/^UPDATEDEFAULT=.*/UPDATEDEFAULT=no/' /etc/sysconfig/kernel
