#!/bin/bash

# 使用 pacstrap 在 /mnt 目录下初始化密钥环并安装软件包
pacstrap -K /mnt base base-devel linux-firmware networkmanager systemd-networkd systemd-resolvconf bluez bluez-utils vim nano git zsh openssh ntfs-3g reflector amd-ucode wireplumber alsa-utils man-db man-pages texinfo noto-fonts noto-fonts-cjk noto-fonts-emoji gtkmm3 --noconfirm

# 启用必要的服务
sudo systemctl enable NetworkManager 
sudo systemctl enable bluetooth
sudo systemctl enable systemd-networkd
sudo systemctl enable systemd-resolvconf

echo "success"

