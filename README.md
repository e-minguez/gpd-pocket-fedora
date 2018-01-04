# gpd-pocket-fedora

Compile the kernel in your F27 laptop using the following instructions:

```
sudo dnf groupinstall -y "C Development Tools and Libraries"
sudo dnf install -y zlib-devel libuuid-devel libattr-devel libblkid-devel libselinux-devel libudev-devel openssl-devel elfutils-libelf-devel

mkdir ~/git/
git clone https://github.com/jwrdegoede/linux-sunxi.git gpd-pocket-kernel
cd gpd-pocket-kernel
make clean
make -j $(getconf _NPROCESSORS_ONLN) binrpm-pkg LOCALVERSION=-gpd-custom
```

This will create two rpm packages that should be installed in the gpd pocket.
Copy them from your laptop in from `~/rpmbuild/RPMS/x86_64` to a pendrive and install it using dnf:

```
sudo dnf install -y /run/media/$USER/<pendrive>/*.rpm
```

Then, run the scripts in any order and reboot.

After the first reboot, ensure you are using your new kernel:

```
uname -a
```

Then add the modules to the initrd image:

```
sudo dracut -f /boot/initramfs-$(uname -r).img $(uname -r)
```

Reboot again... and profit!!!

## References
http://hansdegoede.livejournal.com/17445.html
https://github.com/stockmind/gpd-pocket-ubuntu-respin
https://wiki.archlinux.org/index.php/GPD_Pocket
