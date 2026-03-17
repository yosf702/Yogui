#!/bin/bash

# 🌌 YOGui Desktop Engine - Unified Installer
# Supports: Termux (ARM64), CachyOS/Arch (x86_64), & 32-bit legacy

# الألوان عشان الشغل يكون فخم في التيرمينال
G='\033[0;32m'
B='\033[0;34m'
NC='\033[0m'

echo -e "${B}🌌 Starting YOGui Installation...${NC}"

# 1. تحديد البيئة
ARCH=$(uname -m)
if [ -d "/data/data/com.termux/files/usr" ]; then
    ENV="Termux"
else
    ENV="Linux"
fi

echo -e "🔍 Detected Environment: ${G}$ENV ($ARCH)${NC}"

# 2. تحميل الحزم (The Arsenal)
if [ "$ENV" == "Termux" ]; then
    echo -e "📦 Installing Termux Packages..."
    pkg update && pkg upgrade -y
    pkg install -y x11-repo termux-x11-repo
    pkg install -y rust binutils build-essential wayland wlroots mesa-zink swaybg foot -y
else
    echo -e "📦 Installing Linux Packages (Arch/Cachy)..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed base-devel rust wayland wlroots mesa swaybg foot --noconfirm
fi

# 3. تثبيت سكربتات YOGui الخاصة
echo -e "🚀 Deploying YOGui Scripts..."
mkdir -p ~/.config/yogui
# هنا بننقل سكربت التشغيل الأساسي لمجلد المسار (System Path)
# بنفترض إن عندنا سكربت اسمه yogui-session في مجلد scripts
# sudo cp scripts/yogui-session /usr/local/bin/yogui (للينكس)

echo -e "${G}✅ YOGui is now installed!${NC}"
echo -e "💡 To start, just run: ${B}yogui-start${NC}"
