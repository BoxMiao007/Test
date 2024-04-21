#!/bin/bash

# 获取最新的镜像列表
reflector -c China -l 10 --sort rate --save /etc/pacman.d/mirrorlist

# 编辑 pacman 配置文件
sed -i 's/^#Color/Color/' /etc/pacman.conf
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf

# 更新系统密钥环
pacman -Sy archlinux-keyring --noconfirm

# 更新 archinstall 工具
sudo pacman -Sy archinstall --noconfirm

echo "success"
