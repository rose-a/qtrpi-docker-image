#!/bin/bash

source ${0%/*}/common.sh

message 'Creating qtrpi directory structure'

# sanity check for mounted image not needed, its a clean ubuntu docker image
#umount /mnt/raspbian
#umount $ROOT/raspbian/sysroot-full/sys
#umount $ROOT/raspbian/sysroot-full/dev
#umount $ROOT/raspbian/sysroot-full/proc

mkdir -p $ROOT
chown -R $USER:$USER $ROOT
cd_root

mkdir raspi raspbian bin logs

