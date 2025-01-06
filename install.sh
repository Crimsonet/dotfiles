#!/bin/bash

# @Encode : UTF-8
# @Author : Crimsonet
# @Repo   : dotfiles
# @File   : install
# @Time   : 1/1/25
# @IDE    : GoLand

# Use ANSI escape sequences to set green output
green='\033[0;32m'
reset='\033[0m'

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

	packages=(
		"linux-zen" "linux-zen-headers" "hyprland" "hyprlock" "hyprpaper" "hyprcursor" "hyprgraphics" "hyprutils" "waybar" "sddm" "gnome" "alacritty" "fish" "eza" "mission-center" "nautilus" "fcitx5" "rime-double-pinyin" "pipewire" "vlc" "code" "vim" "vi" "nano" "wl-clipboard" "grim" "fontconfig" "noto-fonts-cjk" "noto-fonts-emoji" "ttf-ubuntu-font-family" "git" "base-devel"
	)

	sudo pacman -S --noconfirm --needed "${packages[@]}"

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

	yay -S --noconfirm --needed tofi

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

	# Install the linux-zen kernel
	sudo emerge --ask sys-kernel/linux-zen
	# Install the linux-zen kernel and its headers
	sudo emerge --ask sys-kernel/linux-zen sys-kernel/linux-zen-headers

	# Install hyprland and related packages
	# sudo emerge --ask x11-wm/hyprland x11-misc/hyprlock x11-misc/hyprpaper x11-misc/hyprcursor x11-misc/hyprgraphics x11-misc/hyprutils
	emerge --ask gui-wm/hyprland
	eselect repository enable guru
    emaint sync -r guru
    emerge --ask gui-apps/hyprlock
    emerge --ask gui-apps/hypridle
    emerge --ask gui-libs/xdg-desktop-portal-hyprland
    emerge --ask gui-apps/hyprland-plugins
    emerge --ask gui-apps/hyprpaper
    emerge --ask gui-apps/hyprpicker
    emerge --ask gui-wm/hyprland-contrib

	# Install waybar
	sudo emerge --ask x11-misc/waybar
	# Install sddm display manager
	sudo emerge --ask x11-misc/sddm
	# Install gnome desktop environment (adjust as needed, might need more specific packages)
	sudo emerge --ask gnome-base/gnome
	# Install alacritty terminal
	sudo emerge --ask x11-terms/alacritty
	# Install fish shell
	sudo emerge --ask shells/fish
	# Install eza file manager
	sudo emerge --ask sys-apps/eza
	# Install mission-center (if the corresponding Gentoo package exists)
	# Here, assume there is no direct corresponding package, need to find a suitable alternative package or compile and install
	# For example, if there is a package with similar functionality called gentoo-mission-center
	# sudo emerge --ask some-category/gentoo-mission-center
	# Install nautilus file manager
	sudo emerge --ask gnome-extra/nautilus
	# Install fcitx5 input method framework
	sudo emerge --ask app-i18n/fcitx5
	# Install rime-double-pinyin input method scheme
	sudo emerge --ask app-i18n/rime-double-pinyin
	# Install pipewire audio and video service
	sudo emerge --ask media-sound/pipewire
	# Install vlc media player
	sudo emerge --ask media-video/vlc
	# Install code editor (if it means Visual Studio Code, might need special installation method)
	# For Visual Studio Code, you can use eix to find the corresponding package or refer to the official documentation
	# For example, might need to install from binary package instead of using emerge directly
	# Here, assume there is no direct corresponding package, need to find a suitable alternative package or compile and install
	# For example, if there is a package with similar functionality called gentoo-code-editor
	# sudo emerge --ask some-category/gentoo-code-editor
	# Install vim editor
	sudo emerge --ask app-editors/vim
	# Install vi editor (usually an alias of vim)
	sudo emerge --ask app-editors/vi
	# Install nano editor
	sudo emerge --ask app-editors/nano
	# Install wl-clipboard
	sudo emerge --ask x11-misc/wl-clipboard
	# Install grim screenshot tool
	sudo emerge --ask x11-misc/grim

	# Check if AMD GPU is present
	lspci | grep -q 'VGA.*AMD'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected AMD GPU."
		# Install AMD GPU drivers
		sudo emerge --ask --oneshot x11-drivers/xf86-video-amdgpu media-libs/mesa media-libs/vulkan-radeon
	fi
	# Check if Intel GPU is present
	lspci | grep -q 'VGA.*Intel'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected Intel GPU."
		# Install Intel GPU drivers
		sudo emerge --ask --oneshot x11-drivers/xf86-video-intel media-libs/mesa media-libs/vulkan-intel
	fi
	# Check if NVIDIA GPU is present
	lspci | grep -q 'VGA.*NVIDIA'
	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		echo -e "Detected NVIDIA GPU."
		# Install NVIDIA GPU drivers
		sudo emerge --ask --oneshot x11-drivers/nvidia-drivers
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

# Create directories and copy gtk configuration files
#	mkdir -p ~/.config/gtk-3.0
#	cp gtk-3.0/bookmarks ~/.config/gtk-3.0/
#	echo -e "${green}[$(date +%T)]${reset} >>> gtk-3.0/bookmarks has been installed."
#	cp gtk-3.0/settings.ini ~/.config/gtk-3.0/
#	echo -e "${green}[$(date +%T)]${reset} >>> gtk-3.0/settings.ini has been installed."
#
#	mkdir -p ~/.config/gtk-4.0
#	cp gtk-4.0/settings.ini ~/.config/gtk-4.0/
#	echo -e "${green}[$(date +%T)]${reset} >>> gtk-4.0/settings.ini has been installed."

# Create directories and copy vlc configuration files
#	mkdir -p ~/.config/vlc
#	cp vlc/vlc-qt-interface.conf ~/.config/vlc/
#	echo -e "${green}[$(date +%T)]${reset} >>> vlc/vlc-qt-interface.conf has been installed."
#	cp vlc/vlcrc ~/.config/vlc/
#	echo -e "${green}[$(date +%T)]${reset} >>> vlc/vlcrc has been installed."
