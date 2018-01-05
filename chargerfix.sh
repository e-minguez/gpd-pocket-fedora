#!/bin/bash

cat << EOF > /tmp/99-local.hwdb
sensor:modalias:acpi:KIOX000A*:dmi*:
 ACCEL_MOUNT_MATRIX=-1, 0, 0; 0, -1, 0; 0, 0, 1
EOF

sudo mv /tmp/99-local.hwdb /lib/udev/hwdb.d/99-local.hwdb
sudo udevadm hwdb --update
