sudo dnf groupinstall -y "C Development Tools and Libraries"
sudo dnf install -y zlib-devel libuuid-devel libattr-devel libblkid-devel libselinux-devel libudev-devel openssl-devel elfutils-libelf-devel

mkdir ~/git/
git clone https://github.com/jwrdegoede/linux-sunxi.git gpd-pocket-kernel
cd gpd-pocket-kernel
make clean
make -j $(getconf _NPROCESSORS_ONLN) binrpm-pkg LOCALVERSION=-eminguez
