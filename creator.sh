#!/bin/sh

set -xe

ROOTFS=/root/rootfs
FOLDERYOUWANT=/mnt/c/Users/Nathan/Documents/GitHub/kivy-easier/dev/v2
FIRSTFOLDER=/mnt/c/Users/Nathan/Documents/GitHub/kivy-easier
U=ke

# Initial packages for chroot side

[ -d $ROOTFS ] && rm -r $ROOTFS

set +e
mkarchroot $ROOTFS lld python-virtualenv python-filelock git \
zip unzip jdk8-openjdk python-pip autoconf libtool pkg-config \
zlib cython gzip patch gcc make automake sed sudo pacman \
util-linux wget
set -e

# New user

sudo chmod +w $ROOTFS/etc/sudoers
sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' $ROOTFS/etc/sudoers

arch-chroot $ROOTFS groupadd users
arch-chroot $ROOTFS groupadd wheel
arch-chroot $ROOTFS useradd -m -G wheel -s /bin/bash $U

arch-chroot $ROOTFS sh -c "echo -e \"$U\n$U\" | passwd $U"

# Extra packages

sed -i 's/CheckSpace/#CheckSpace/g' $ROOTFS/etc/pacman.conf

arch-chroot $ROOTFS pacman -S fakeroot --needed --noconfirm

arch-chroot $ROOTFS sudo -u $U git -C /home/$U clone https://aur.archlinux.org/ncurses5-compat-libs.git
arch-chroot $ROOTFS sh -c "cd /home/$U/ncurses5-compat-libs && sudo -u $U makepkg -sic --skippgpcheck --noconfirm"

arch-chroot $ROOTFS pip install buildozer

# Extra files and folders

cp -r $FIRSTFOLDER/helps/ $ROOTFS/home/$U

cp -r $FIRSTFOLDER/scripts/ $ROOTFS/home/$U
chmod +x $ROOTFS/home/$U/scripts/*

#wget -O $ROOTFS/home/$U/platform-tools-latest-windows.zip https://dl.google.com/android/repository/platform-tools-latest-windows.zip
#unzip -u $ROOTFS/home/$U/platform-tools-latest-windows.zip -d $ROOTFS/home/$U/

mkdir $ROOTFS/home/$U/values
chmod 777 $ROOTFS/home/$U/values

# Documentation

arch-chroot $ROOTFS sh -c "pacman -Q > /pkglist.txt"
while [ ! -f $ROOTFS/pkglist.txt ]; do sleep 1; done
mv $ROOTFS/pkglist.txt $FOLDERYOUWANT

du -sh $ROOTFS/ > $FOLDERYOUWANT/decompressed-size.txt

# Clean up

arch-chroot $ROOTFS pacman -R fakeroot --noconfirm

arch-chroot $ROOTFS pacman -Scc --noconfirm

rm -r $ROOTFS/home/$U/ncurses5-compat-libs

rm -r $ROOTFS/root/.cache/*

rm $ROOTFS/etc/machine-id

rm -r $ROOTFS/etc/pacman.d/gnupg

sed -i 's/#CheckSpace/CheckSpace/g' $ROOTFS/etc/pacman.conf

#rm $ROOTFS/home/$U/platform-tools-latest-windows.zip

# Finishing

cd $ROOTFS && GZIP=-9 tar -cvzf $FOLDERYOUWANT/rootfs.tar.gz .

du -sh $FOLDERYOUWANT/rootfs.tar.gz > $FOLDERYOUWANT/compressed-size.txt  # also documentation
