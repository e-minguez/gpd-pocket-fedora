#!/bin/bash
# rpm-pkg    - Build both source and binary RPM kernel packages
# binrpm-pkg - Build only the binary kernel package
FEDORAVERSION="28"
PKGTYPE="rpm-pkg"
VERSION="gpd-custom-atom"

cd ${HOME}/git/gpd-pocket-kernel
git fetch --all
git reset --hard origin/master
git clean -dfx
COMMITID=$(git log --format="%h" -n 1)
make clean
sed -i \
  -e 's/# CONFIG_MATOM is not set/CONFIG_MATOM=y/g' \
  -e 's/CONFIG_GENERIC_CPU=y/# CONFIG_GENERIC_CPU is not set/g' \
  -e 's/# CONFIG_BACKLIGHT_PWM is not set/CONFIG_BACKLIGHT_PWM=m/g' \
  -e 's/# CONFIG_LEDS_PWM is not set/CONFIG_LEDS_PWM=m/g' \
  ${HOME}/git/gpd-pocket-kernel/.config
make -j $(getconf _NPROCESSORS_ONLN) ${PKGTYPE} LOCALVERSION=-${COMMITID}-${VERSION}
for package in ${HOME}/rpmbuild/RPMS/x86_64/kernel-*
do
  package_cloud push eminguez/gpd-pocket-kernel/fedora/${FEDORAVERSION} ${package} && rm -f ${package}
done
rpmdev-wipetree
