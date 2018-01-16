#!/bin/bash
sudo cp files/eminguez-gpd-pocket-kernel.repo /etc/yum.repos.d/
sudo yum clean all
sudo yum update kernel -y
