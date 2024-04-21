#!/bin/bash

# 获取最新的镜像列表
reflector -c China -l 10 --sort rate --save /etc/pacman.d/mirrorlist

# 编辑 pacman 配置文件
sed -i 's/^#Color/Color/' /etc/pacman.conf
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf

# 更新系统密钥环
pacman -Sy archlinux-keyring --noconfirm

# 确保 /mnt 是一个挂载点
if ! mountpoint -q /mnt; then
    echo "/mnt is not a mountpoint. Please mount your target system root directory to /mnt before running this script."
    exit 1
fi

# 使用 pacstrap 在 /mnt 目录下初始化密钥环并安装软件包
pacstrap -K /mnt base base-devel dhcpcd linux-firmware networkmanager systemd-networkd systemd-resolvconf bluez bluez-utils vim nano git zsh openssh ntfs-3g reflector amd-ucode wireplumber alsa-utils man-db man-pages texinfo noto-fonts noto-fonts-cjk noto-fonts-emoji gtkmm3 --noconfirm

# 启用必要的服务
arch-chroot /mnt systemctl enable NetworkManager 
arch-chroot /mnt systemctl enable bluetooth

# 更新 archinstall 工具
arch-chroot /mnt pacman -Sy archinstall --noconfirm

echo "success"
