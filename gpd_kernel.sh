#!/bin/bash
# rpm-pkg    - Build both source and binary RPM kernel packages
# binrpm-pkg - Build only the binary kernel package
PKGTYPE="rpm-pkg"
cd ${HOME}/git/gpd-pocket-kernel
git fetch --all
git reset --hard origin/master
COMMITID=$(git log --format="%h" -n 1)
make clean
make -j $(getconf _NPROCESSORS_ONLN) ${PKGTYPE} LOCALVERSION=-${COMMITID}-gpd-custom
package_cloud push eminguez/gpd-pocket-kernel/fedora/27 ${HOME}/rpmbuild/RPMS/x86_64/kernel-*
rm -f ${HOME}/rpmbuild/RPMS/x86_64/kernel-*
