# DenOS - Debian Linux build from scratch with Debootstrap#
# Bernardino Lopez [ bernardino.lopez@gmail.com ]
# 11.27.18

# 03_denos_chroot.sh - Customize your Distro
# As root in chroot. Execute the script in a Terminal 
# ./03_denos_chroot.sh

# export LIVE_BOOT=LIVE_BOOT64
source ./config.txt

#echo "debian-live" > /etc/hostname
echo $DISTRO_NAME > /etc/hostname

apt-cache search linux-image

apt-get update && \
apt-get install -y --no-install-recommends \
    linux-image-amd64 \
    live-boot gnupg2 ca-certificates locales \
    systemd-sysv

#Add FS-UAE repo
echo "deb https://download.opensuse.org/repositories/home:/FrodeSolheim:/stable/Debian_10/ /" > /etc/apt/sources.list.d/FrodeSolheim-stable.list
apt-key add - < Release.key
 apt-get update && \
  apt-get install -y --no-install-recommends \
  network-manager net-tools wireless-tools wpagui curl \
  blackbox xserver-xorg-core xserver-xorg xinit xterm \
  lxde lxterminal pcmanfm fs-uae fs-uae-launcher \
  nano && \

apt-get clean

mkdir -p /root/.config/lxsession/LXDE
echo "@fs-uae-launcher" > /root/.config/lxsession/LXDE/autostart
chmod 755 /root/.config/lxsession/LXDE/autostart

echo -e "127.0.0.1\tlocalhost" > /etc/hosts
echo -e "127.0.0.1\tDenOS" >> /etc/hosts

passwd root

exit
