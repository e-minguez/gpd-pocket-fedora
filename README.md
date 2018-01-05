# gpd-pocket-fedora

## Prerrequisites

* [Unlocked BIOS](https://www.reddit.com/r/GPDPocket/comments/6q74en/unlocked_gpd_pocket_bios/)
* [Thermal mod (optional but recommended)](https://www.reddit.com/r/GPDPocket/comments/6lbb7c/modding_gpd_pockets_cooling_now_with_pictures/)
* [BIOS settings (optional but recommended)](https://www.reddit.com/r/GPDPocket/comments/6s7zck/my_unlocked_bios_working_settings_dptf_limit/)
* Enough free space on the hard drive. I've ended up shrinking the Windows partition (Google for it!)

## Installation

* Follow the official instructions to create a bootable
Fedora 27 pendrive and plugin it into the GPD pocket.

* Boot the GPD pocket while pressing "fn+f7" several times until a boot menu
appears and select the pendrive you've just connected.

The kernel parameters for the iso need to be edited after the "quiet" parameter to add:

```
fbcon=rotate:1
```

* In order to do it, select "Boot this media"
* Press "e" to edit the boot options
* Scroll down to the kernel line
* Add the fbcon parameter
* Once finished, press "Ctrl+x" to boot the installation

## Post installation tasks

* Compile the kernel in your F27 laptop using the following instructions:

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

* Clone this repo and copy it to an external pendrive. You can use the same
pendrive than the Fedora installation to have all included.

```
git clone https://github.com/e-minguez/gpd-pocket-fedora.git /run/media/$USER/<pendrive>/
```

* Copy the kernel packages from your laptop from `~/rpmbuild/RPMS/x86_64` to the pendrive.


* Connect the pendrive in the GPD pocket once Fedora 27 has been installed and booted and install the kernel using dnf:

```
sudo dnf install -y /run/media/$USER/<pendrive>/*.rpm
```

* Run the `fix_wifi.sh` script to enable wifi connectivity.

* Connect to your wifi network using the `basic_network.sh` script as:

```
/run/media/$USER/<pendrive>/basic_network.sh <my_ap> <my_password>
```

Then, run all the scripts in any order and reboot.

```
cd /run/media/$USER/<pendrive>/
./alsa.sh
./chargerfix.sh
./dracut.sh
./firewalld.sh
./fix_kernel.sh
./grub.sh
./monitor.sh
sudo reboot
```

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
* http://hansdegoede.livejournal.com/17445.html
* https://github.com/stockmind/gpd-pocket-ubuntu-respin
* https://wiki.archlinux.org/index.php/GPD_Pocket
