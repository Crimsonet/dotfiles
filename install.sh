#!/bin/bash

# @Encode : UTF-8
# @Author : Crimsonet
# @Repo   : dotfiles
# @File   : install
# @Time   : 1/6/25
# @IDE    : GoLand

# Use ANSI escape sequences to set green output
green='\033[0;32m'
reset='\033[0m'

gentooPackages=(
	"sys-kernel/linux-zen"
	"sys-kernel/linux-zen-headers"
	"app-shells/fish"
	"sys-apps/eza"
	"x11-terms/alacritty"
	"dev-libs/wayland"
	"gui-wm/hyprland"
	"gui-apps/hyprlock"
	"gui-apps/hypridle"
	"gui-libs/xdg-desktop-portal-hyprland"
	"gui-apps/hyprland-plugins"
	"gui-apps/hyprpaper"
	"gui-apps/hyprpicker"
	"gui-wm/hyprland-contrib"
	"gui-apps/waybar"
	"x11-misc/sddm"
	"gnome-base/gnome"
	"gnome-extra/nautilus"
	"app-i18n/fcitx5"
	"app-i18n/rime-double-pinyin"
	"media-sound/pipewire"
	"media-video/vlc"
	"app-editors/vim"
	"app-editors/vi"
	"app-editors/nano"
	"x11-misc/wl-clipboard"
	"x11-misc/grim"
	"www-client/firefox"
)

archPackages=(
	"linux-zen"
	"linux-zen-headers"
	"hyprland"
	"hyprlock"
	"hyprpaper"
	"hyprcursor"
	"hyprgraphics"
	"hyprutils"
	"waybar"
	"sddm"
	"gnome"
	"alacritty"
	"fish"
	"eza"
	"mission-center"
	"nautilus"
	"fcitx5"
	"rime-double-pinyin"
	"pipewire"
	"vlc"
	"code"
	"vim"
	"vi"
	"nano"
	"wl-clipboard"
	"grim"
	"fontconfig"
	"noto-fonts-cjk"
	"noto-fonts-emoji"
	"ttf-ubuntu-font-family"
	"git"
	"base-devel"
)

# Create directories and copy font and fontconfig configuration files
sudo mkdir -p /etc/fonts
sudo cp annex/fonts/'Proxima Nova.ttf' /etc/fonts/conf.d/
echo -e "${green}[$(date +%T)]${reset} >>> annex/fonts/'Proxima Nova.ttf' has been installed."
cp fontconfig/conf.d/* ~/.config/fontconfig/conf.d/
echo -e "${green}[$(date +%T)]${reset} >>> fontconfig/conf.d/* has been installed."
cp fontconfig/fonts.conf ~/.config/fontconfig/
echo -e "${green}[$(date +%T)]${reset} >>> fontconfig/fonts.conf has been installed."
cp fontconfig/fonts.conf.back ~/.config/fontconfig/
echo -e "${green}[$(date +%T)]${reset} >>> fontconfig/fonts.conf.back has been installed."
# Create directories and copy fcitx5 configuration files
mkdir -p ~/.config/fcitx5
sudo cp -r fcitx5/conf/* ~/.config/fcitx5/
echo -e "${green}[$(date +%T)]${reset} >>> fcitx5/conf/* has been installed."
sudo cp -r fcitx5/theme/* ~/.local/share/fcitx5/themes/
echo -e "${green}[$(date +%T)]${reset} >>> fcitx5/theme/* has been installed."
cp fcitx5/config ~/.config/fcitx5/
echo -e "${green}[$(date +%T)]${reset} >>> fcitx5/config has been installed."
cp fcitx5/profile ~/.config/fcitx5/
echo -e "${green}[$(date +%T)]${reset} >>> fcitx5/profile has been installed."
# Create directories and copy sddm theme files
sudo mkdir -p ~/.local/share/sddm/themes/arknt
sudo cp -r arknt/* /usr/share/sddm/themes/arknt/
echo -e "${green}[$(date +%T)]${reset} >>> arknt/* has been installed."
# Create directories and copy alacritty configuration files
mkdir -p ~/.config/alacritty
cp alacritty/alacritty.toml ~/.config/alacritty/
echo -e "${green}[$(date +%T)]${reset} >>> alacritty.toml has been installed."
cp alacritty/base16_default_dark.toml ~/.config/alacritty/
echo -e "${green}[$(date +%T)]${reset} >>> base16_default_dark.toml has been installed."
# Create directories and copy fish configuration files
mkdir -p ~/.config/fish
cp fish/conf.d/* ~/.config/fish/conf.d/
echo -e "${green}[$(date +%T)]${reset} >>> fish/conf.d/* has been installed."
cp fish/config.fish ~/.config/fish/
echo -e "${green}[$(date +%T)]${reset} >>> fish/config.fish has been installed."
cp fish/fish_variables ~/.config/fish/
echo -e "${green}[$(date +%T)]${reset} >>> fish/fish_variables has been installed."
cp fish/functions/* ~/.config/fish/functions/
echo -e "${green}[$(date +%T)]${reset} >>> fish/functions/* has been installed."
# Create directories and copy hypr configuration files
mkdir -p ~/.config/hypr
cp hypr/hyprland.conf ~/.config/hypr/
echo -e "${green}[$(date +%T)]${reset} >>> hypr/hyprland.conf has been installed."
cp hypr/hyprlock.conf ~/.config/hypr/
echo -e "${green}[$(date +%T)]${reset} >>> hypr/hyprlock.conf has been installed."
cp hypr/hyprlock.conf.back ~/.config/hypr/
echo -e "${green}[$(date +%T)]${reset} >>> hypr/hyprlock.conf.bak has been installed."
cp hypr/hyprpaper.conf ~/.config/hypr/
echo -e "${green}[$(date +%T)]${reset} >>> hypr/hyprpaper.conf has been installed."
# Create directories and copy kitty configuration files
mkdir -p ~/.config/kitty
cp kitty/kitty.conf ~/.config/kitty/
echo -e "${green}[$(date +%T)]${reset} >>> kitty/kitty.conf has been installed."
# Create directories and copy mako configuration files
mkdir -p ~/.config/mako
cp mako/config ~/.config/mako/
echo -e "${green}[$(date +%T)]${reset} >>> mako/config has been installed."
# Create directories and copy tofi configuration files
mkdir -p ~/.config/tofi
cp tofi/config ~/.config/tofi/
echo -e "${green}[$(date +%T)]${reset} >>> tofi/config has been installed."
# Create directories and copy waybar configuration files
mkdir -p ~/.config/waybar
cp waybar/config ~/.config/waybar/
echo -e "${green}[$(date +%T)]${reset} >>> waybar/config has been installed."
cp waybar/style.css ~/.config/waybar/
echo -e "${green}[$(date +%T)]${reset} >>> waybar/style.css has been installed."

sleep 0.5s

# Check if the system is Arch Linux
if [ -f /etc/arch-release ]; then
	echo -e "System: Arch Linux"

	# Install packages using pacman without confirmation
	# Install necessary dependencies for yay and clone yay from AUR

	# ----- PKG INSTALL IS HERE -----

	sudo pacman -S --noconfirm --needed "${archPackages[@]}"

	xdg-mime default org.gnome.Nautilus.desktop inode/directory

	sudo rm -rf ~/.cache/yay/
	git clone https://aur.archlinux.org/yay.git ~/.cache/yay/
	# shellcheck disable=SC2164
	cd ~/.cache/yay
	makepkg -si
	# shellcheck disable=SC2288
	# shellcheck disable=SC2103
	cd ..
	sudo rm -rf yay

	# shellcheck disable=SC2164
	cd /etc/modprobe.d
	sudo touch hid_apple.conf
	# shellcheck disable=SC2024
	sudo echo -e options hid_apple fnmode=2 >hid_apple.conf
	# Reboot to apply

	yay -S --noconfirm --needed tofi rose-pine-hyprcursor
	hyprctl setcursor rose-pine-hyprcursor 32

	# Check if AMD GPU is present
	lspci | grep -q 'VGA.*AMD'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected AMD GPU."
		# Install AMD GPU drivers
		sudo pacman -S --noconfirm --needed mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon
	fi

	# Check if Intel GPU is present
	lspci | grep -q 'VGA.*Intel'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected Intel GPU."
		# Install Intel GPU drivers
		sudo pacman -S --noconfirm --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel
	fi

	# Check if NVIDIA GPU is present
	lspci | grep -q 'VGA.*NVIDIA'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected NVIDIA GPU."
		# Install NVIDIA GPU drivers
		sudo pacman -S --noconfirm --needed nvidia nvidia-utils
	fi

# Check if the system is Gentoo Linux
elif [ -f /etc/gentoo-release ]; then
	echo -e "System: Gentoo Linux"

	sudo emerge --sync

	# ----- PKG INSTALL IS HERE -----

	for package in "${gentooPackages[@]}"; do
	  sudo emerge --ask --autounmask-write "$package"
	done

	# Check if AMD GPU is present
	lspci | grep -q 'VGA.*AMD'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected AMD GPU."
		# Install AMD GPU drivers
		sudo emerge --ask x11-drivers/xf86-video-amdgpu media-libs/mesa media-libs/vulkan-radeon
	fi
	# Check if Intel GPU is present
	lspci | grep -q 'VGA.*Intel'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected Intel GPU."
		# Install Intel GPU drivers
		sudo emerge --ask x11-drivers/xf86-video-intel media-libs/mesa media-libs/vulkan-intel
	fi
	# Check if NVIDIA GPU is present
	lspci | grep -q 'VGA.*NVIDIA'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected NVIDIA GPU."
		# Install NVIDIA GPU drivers
		sudo emerge --ask x11-drivers/nvidia-drivers
	fi
else
	# Get the main language part of the LANG environment variable
	LANG=$(echo -e "$LANG" | cut -d'.' -f1)
	msg_en="Maybe unsupported Linux distribution."
	msg_zh="可能不支持的 Linux 发行版."
	msg_fr="Peut-être une distribution Linux non supportée."
	msg_de="Möglicherweise nicht unterstützte Linux-Distribution."
	msg_es="Posible distribución Linux no soportada."
	msg_ru="Возможно, неподдерживаемая дистрибуция Linux."
	msg_ja="サポートされていない Linux ディストリビューションの可能性があります。"
	# Output a message based on the system language
	if [ "$LANG" = "zh_CN" ]; then
		echo -e "$msg_zh"
	elif [ "$LANG" = "fr_FR" ]; then
		echo -e "$msg_fr"
	elif [ "$LANG" = "de_DE" ]; then
		echo -e "$msg_de"
	elif [ "$LANG" = "es_ES" ]; then
		echo -e "$msg_es"
	elif [ "$LANG" = "ru_RU" ]; then
		echo -e "$msg_ru"
	elif [ "$LANG" = "ja_JP" ]; then
		echo -e "$msg_ja"
	else
		echo -e "$msg_en"
	fi
fi

# This may help u when the hyprpaper did not launch properly
systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprpaper.service

# Get the main language part of the LANG environment variable
LANG=$(echo -e "$LANG" | cut -d'.' -f1)

# shellcheck disable=SC1012
echo -e ""

# Output a message based on the system language in green color
case $LANG in
en_US)
	echo -e "${green}The configuration has been installed. Please adjust according to your own situation.${reset}"
	;;
zh_CN)
	echo -e "${green}配置已安装完毕，请根据自身情况进行调整。${reset}"
	;;
fr_FR)
	echo -e "${green}La configuration a été installée. Veuillez l'ajuster en fonction de votre situation.${reset}"
	;;
de_DE)
	echo -e "${green}Die Konfiguration wurde installiert. Bitte anpassen Sie es nach Ihrer Situation.${reset}"
	;;
es_ES)
	echo -e "${green}La configuración se ha instalado. Ajuste según su situación.${reset}"
	;;
ja_JP)
	echo -e "${green}設定はインストールされました。状況に応じて調整してください。${reset}"
	;;
*)
	echo -e "${green}The configuration has been installed. Please adjust according to your own situation.${reset}"
	;;
esac

# shellcheck disable=SC1012
echo -e ""
