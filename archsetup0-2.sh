#!/bin/bash

# 使用 pacstrap 在 /mnt 目录下初始化密钥环并安装软件包
pacstrap -K /mnt base base-devel linux-firmware networkmanager ntfs-3g vim nano git zsh reflector amd-ucode noto-fonts noto-fonts-cjk noto-fonts-emoji --noconfirm

# 启用必要的服务
sudo systemctl enable --now NetworkManager 
echo "success"

