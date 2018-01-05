#!/bin/bash
sudo sed -i -e "s/^GRUB_DEFAULT=.*/GRUB_DEFAULT=saved/" /etc/default/grub
sudo sed -i -e "s/^GRUB_SAVEDEFAULT=.*/GRUB_SAVEDEFAULT=false/" /etc/default/grub
sudo sed -i -e "s/quiet/quiet fbcon=rotate:1/" /etc/default/grub
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
MYKERNEL=$(sudo grep -P "submenu|^menuentry" /boot/efi/EFI/fedora/grub.cfg | cut -d "'" -f2 | grep "gpd-custom")
sudo grub2-set-default "${MYKERNEL}"
