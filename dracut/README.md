echo 'add_drivers+="pwm-lpss pwm-lpss-platform"' > /etc/dracut.conf.d/gpd_pocket.conf

This can be ommited if creating the conf before installing the new kernel
# dracut -f /boot/initramfs-$(uname -r).img $(uname -r)
