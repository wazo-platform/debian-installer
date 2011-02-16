#!/bin/sh

DEBS="bf.deb grub-common.deb grub.deb"

for D in ${DEBS}; do
	wget -O /target/tmp/${D} ftp://fai.proformatique.com/fai/etchnhalf/${D}
done

chroot /target dpkg -i $(echo ${DEBS} | sed -r 's#(^| )# /tmp/#g')

