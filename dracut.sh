#!/bin/bash
echo 'add_drivers+="pwm-lpss pwm-lpss-platform i915"' | sudo tee -a /etc/dracut.conf.d/gpd_pocket.conf
echo 'dracut_rescue_images="no"' | sudo tee -a /etc/dracut.conf.d/gpd_pocket.conf

echo "Run:"
echo "sudo dracut -f /boot/initramfs-$(uname -r).img $(uname -r)"
echo "After booting the new kernel"
