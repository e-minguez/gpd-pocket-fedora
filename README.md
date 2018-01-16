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
* Select "Start Fedora-Workstation-Live 27" but don't press enter yet
* Press "e" to edit the boot options
* Scroll down to the kernel line
* Add the following fbcon parameter after the "quiet" parameter to properly rotate the screen:
```
fbcon=rotate:1
```
* Press "Ctrl+x" to boot the installation
* Let Fedora 27 to start
* Once in the desktop and in order to rotate the screen in the live system, press the Windows button, type "displays" and press enter. This will open the displays settings.
* Modify the orientation to be "Portrait left" and apply the configuration
NOTE: If the "apply" button doesn't appear, change the resolution as well and then it will appear. Then select the proper resolution again.
* Install Fedora 27 as you wish

## Post installation tasks

* Clone this repo and copy it to an external pendrive. You can use the same
pendrive than the Fedora installation to have all included.
```
git clone https://github.com/e-minguez/gpd-pocket-fedora.git /run/media/$USER/<pendrive>/
```
* Connect the pendrive in the GPD pocket once Fedora 27 has been installed and booted
* Run the `fix_wifi.sh` script to enable wifi connectivity.
```
/run/media/$USER/<pendrive>/fix_wifi.sh
```
* Connect to your wifi network using the `basic_network.sh` script as:
```
/run/media/$USER/<pendrive>/basic_network.sh <my_ap> <my_password>
```
* Then, run all the scripts in the following order and reboot.
```
cd /run/media/$USER/<pendrive>/
./alsa.sh
./chargerfix.sh
./dracut.sh
./firewalld.sh
./fix_kernel.sh
./grub.sh
./monitor.sh
./kernel.sh
sudo reboot
```

**NOTE:** The rescue kernel is removed in the fix_kernel script and
prevent to be built again in the dracut script. Review it if you want
to have a rescue kernel!!!

* After the first reboot, ensure you are using your new kernel:
```
uname -a
```
* Profit!!!

## Compile the kernel manually

Compile the kernel in your F27 laptop using the following instructions:

```
sudo dnf groupinstall -y "C Development Tools and Libraries"
sudo dnf install -y zlib-devel libuuid-devel libattr-devel libblkid-devel libselinux-devel libudev-devel openssl-devel elfutils-libelf-devel

mkdir ~/git/
cd git
git clone https://github.com/jwrdegoede/linux-sunxi.git gpd-pocket-kernel
cd gpd-pocket-kernel
make clean
make -j $(getconf _NPROCESSORS_ONLN) binrpm-pkg LOCALVERSION=-gpd-custom
```

This will create two rpm packages that should be installed in the gpd pocket.

* Copy the kernel packages from your laptop from `~/rpmbuild/RPMS/x86_64` to the pendrive.
* Install the kernel using dnf:
```
sudo dnf install -y /run/media/$USER/<pendrive>/*.rpm
```

## References
* http://hansdegoede.livejournal.com/17445.html
* https://github.com/stockmind/gpd-pocket-ubuntu-respin
* https://wiki.archlinux.org/index.php/GPD_Pocket
