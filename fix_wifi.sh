#!/bin/bash
# sudo wget -O /lib/firmware/brcm/brcmfmac4356-pcie.txt https://fedorapeople.org/~jwrdegoede/brcmfmac4356-pcie.txt
sudo cp files/brcmfmac4356-pcie.txt /lib/firmware/brcm/brcmfmac4356-pcie.txt
sudo modprobe -r brcmfmac
sudo modprobe brcmfmac
