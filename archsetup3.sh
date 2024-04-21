#!/bin/bash

# 获取最新的镜像列表
reflector -c China -l 10 --sort rate --save /etc/pacman.d/mirrorlist

# 编辑 pacman 配置文件
sed -i 's/^#Color/Color/' /etc/pacman.conf
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf

# 更新系统密钥环
pacman -Sy archlinux-keyring --noconfirm

# 使用 pacstrap 在 /mnt 目录下初始化密钥环并安装软件包
# pacstrap -K /mnt base base-devel linux-firmware networkmanager systemd-networkd systemd-resolvconf bluez bluez-utils vim nano git zsh openssh ntfs-3g reflector amd-ucode wireplumber alsa-utils man-db man-pages texinfo noto-fonts noto-fonts-cjk noto-fonts-emoji gtkmm3 --noconfirm

cd /

# 启用必要的服务
arch-chroot systemctl enable NetworkManager 
arch-chroot systemctl enable bluetooth

# 更新 archinstall 工具
arch-chroot pacman -Sy archinstall --noconfirm

echo "success"
