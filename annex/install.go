/**
 *	@Encode : UTF-8
 *	@Author : Crimsonet
 *	@Repo   : dotfiles
 *	@File   : install
 *	@Time   : 1/5/25
 *	@IDE    : GoLand
 */

package main

import (
	_ "bufio"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	_ "regexp"
	"strings"
	_ "syscall"
	"time"
)

func main() {
	// Create directories and copy font and fontconfig configuration files
	err := os.MkdirAll("/etc/fonts", 0755)
	if err != nil {
		fmt.Println("Error creating /etc/fonts:", err)
		return
	}
	err = copyFile("annex/fonts/Proxima Nova.ttf", "/etc/fonts/conf.d/Proxima Nova.ttf")
	if err == nil {
		fmt.Printf("[%s] >>> annex/fonts/'Proxima Nova.ttf' has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying annex/fonts/Proxima Nova.ttf:", err)
	}
	err = copyFiles("fontconfig/conf.d", filepath.Join(os.Getenv("HOME"), ".config/fontconfig/conf.d"))
	if err == nil {
		fmt.Printf("[%s] >>> fontconfig/conf.d/* has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fontconfig/conf.d/*:", err)
	}
	err = copyFile("fontconfig/fonts.conf", filepath.Join(os.Getenv("HOME"), ".config/fontconfig/fonts.conf"))
	if err == nil {
		fmt.Printf("[%s] >>> fontconfig/fonts.conf has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fontconfig/fonts.conf:", err)
	}
	err = copyFile("fontconfig/fonts.conf.back", filepath.Join(os.Getenv("HOME"), ".config/fontconfig/fonts.conf.back"))
	if err == nil {
		fmt.Printf("[%s] >>> fontconfig/fonts.conf.back has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fontconfig/fonts.conf.back:", err)
	}

	// Create directories and copy fcitx5 configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/fcitx5"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/fcitx5:", err)
		return
	}
	err = copyFiles("fcitx5/conf", filepath.Join(os.Getenv("HOME"), ".config/fcitx5/conf"))
	if err == nil {
		fmt.Printf("[%s] >>> fcitx5/conf/* has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fcitx5/conf/*:", err)
	}
	err = copyFiles("fcitx5/theme", filepath.Join(os.Getenv("HOME"), ".local/share/fcitx5/themes"))
	if err == nil {
		fmt.Printf("[%s] >>> fcitx5/theme/* has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fcitx5/theme/*:", err)
	}
	err = copyFile("fcitx5/config", filepath.Join(os.Getenv("HOME"), ".config/fcitx5/config"))
	if err == nil {
		fmt.Printf("[%s] >>> fcitx5/config has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fcitx5/config:", err)
	}
	err = copyFile("fcitx5/profile", filepath.Join(os.Getenv("HOME"), ".config/fcitx5/profile"))
	if err == nil {
		fmt.Printf("[%s] >>> fcitx5/profile has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fcitx5/profile:", err)
	}

	// Create directories and copy sddm theme files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".local/share/sddm/themes/arknt"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.local/share/sddm/themes/arknt:", err)
		return
	}
	err = copyFiles("arknt", "/usr/share/sddm/themes/arknt")
	if err == nil {
		fmt.Printf("[%s] >>> arknt/* has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying arknt/*:", err)
	}

	// Create directories and copy alacritty configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/alacritty"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/alacritty:", err)
		return
	}
	err = copyFile("alacritty/alacritty.toml", filepath.Join(os.Getenv("HOME"), ".config/alacritty/alacritty.toml"))
	if err == nil {
		fmt.Printf("[%s] >>> alacritty.toml has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying alacritty/alacritty.toml:", err)
	}
	err = copyFile("alacritty/base16_default_dark.toml", filepath.Join(os.Getenv("HOME"), ".config/alacritty/base16_default_dark.toml"))
	if err == nil {
		fmt.Printf("[%s] >>> base16_default_dark.toml has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying alacritty/base16_default_dark.toml:", err)
	}

	// Create directories and copy fish configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/fish"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/fish:", err)
		return
	}
	err = copyFiles("fish/conf.d", filepath.Join(os.Getenv("HOME"), ".config/fish/conf.d"))
	if err == nil {
		fmt.Printf("[%s] >>> fish/conf.d/* has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fish/conf.d/*:", err)
	}
	err = copyFile("fish/config.fish", filepath.Join(os.Getenv("HOME"), ".config/fish/config.fish"))
	if err == nil {
		fmt.Printf("[%s] >>> fish/config.fish has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fish/config.fish:", err)
	}
	err = copyFile("fish/fish_variables", filepath.Join(os.Getenv("HOME"), ".config/fish/fish_variables"))
	if err == nil {
		fmt.Printf("[%s] >>> fish/fish_variables has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fish/fish_variables:", err)
	}
	err = copyFiles("fish/functions", filepath.Join(os.Getenv("HOME"), ".config/fish/functions"))
	if err == nil {
		fmt.Printf("[%s] >>> fish/functions/* has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying fish/functions/*:", err)
	}

	// Create directories and copy gtk configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/gtk-3.0"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/gtk-3.0:", err)
		return
	}
	err = copyFile("gtk-3.0/bookmarks", filepath.Join(os.Getenv("HOME"), ".config/gtk-3.0/bookmarks"))
	if err == nil {
		fmt.Printf("[%s] >>> gtk-3.0/bookmarks has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying gtk-3.0/bookmarks:", err)
	}
	err = copyFile("gtk-3.0/settings.ini", filepath.Join(os.Getenv("HOME"), ".config/gtk-3.0/settings.ini"))
	if err == nil {
		fmt.Printf("[%s] >>> gtk-3.0/settings.ini has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying gtk-3.0/settings.ini:", err)
	}
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/gtk-4.0"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/gtk-4.0:", err)
		return
	}
	err = copyFile("gtk-4.0/settings.ini", filepath.Join(os.Getenv("HOME"), ".config/gtk-4.0/settings.ini"))
	if err == nil {
		fmt.Printf("[%s] >>> gtk-4.0/settings.ini has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying gtk-4.0/settings.ini:", err)
	}

	// Create directories and copy hypr configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/hypr"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/hypr:", err)
		return
	}
	err = copyFile("hypr/hyprland.conf", filepath.Join(os.Getenv("HOME"), ".config/hypr/hyprland.conf"))
	if err == nil {
		fmt.Printf("[%s] >>> hypr/hyprland.conf has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying hypr/hyprland.conf:", err)
	}
	err = copyFile("hypr/hyprlock.conf", filepath.Join(os.Getenv("HOME"), ".config/hypr/hyprlock.conf"))
	if err == nil {
		fmt.Printf("[%s] >>> hypr/hyprlock.conf has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying hypr/hyprlock.conf:", err)
	}
	err = copyFile("hypr/hyprlock.conf.back", filepath.Join(os.Getenv("HOME"), ".config/hypr/hyprlock.conf.back"))
	if err == nil {
		fmt.Printf("[%s] >>> hypr/hyprlock.conf.back has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying hypr/hyprlock.conf.back:", err)
	}
	err = copyFile("hypr/hyprpaper.conf", filepath.Join(os.Getenv("HOME"), ".config/hypr/hyprpaper.conf"))
	if err == nil {
		fmt.Printf("[%s] >>> hypr/hyprpaper.conf has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying hypr/hyprpaper.conf:", err)
	}

	// Create directories and copy kitty configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/kitty"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/kitty:", err)
		return
	}
	err = copyFile("kitty/kitty.conf", filepath.Join(os.Getenv("HOME"), ".config/kitty/kitty.conf"))
	if err == nil {
		fmt.Printf("[%s] >>> kitty/kitty.conf has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying kitty/kitty.conf:", err)
	}

	// Create directories and copy mako configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/mako"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/mako:", err)
		return
	}
	err = copyFile("mako/config", filepath.Join(os.Getenv("HOME"), ".config/mako/config"))
	if err == nil {
		fmt.Printf("[%s] >>> mako/config has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying mako/config:", err)
	}

	// Create directories and copy tofi configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/tofi"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/tofi:", err)
		return
	}
	err = copyFile("tofi/config", filepath.Join(os.Getenv("HOME"), ".config/tofi/config"))
	if err == nil {
		fmt.Printf("[%s] >>> tofi/config has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying tofi/config:", err)
	}

	// Create directories and copy vlc configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/vlc"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/vlc:", err)
		return
	}
	err = copyFile("vlc/vlc-qt-interface.conf", filepath.Join(os.Getenv("HOME"), ".config/vlc/vlc-qt-interface.conf"))
	if err == nil {
		fmt.Printf("[%s] >>> vlc/vlc-qt-interface.conf has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying vlc/vlc-qt-interface.conf:", err)
	}
	err = copyFile("vlc/vlcrc", filepath.Join(os.Getenv("HOME"), ".config/vlc/vlcrc"))
	if err == nil {
		fmt.Printf("[%s] >>> vlc/vlcrc has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying vlc/vlcrc:", err)
	}

	// Create directories and copy waybar configuration files
	err = os.MkdirAll(filepath.Join(os.Getenv("HOME"), ".config/waybar"), 0755)
	if err != nil {
		fmt.Println("Error creating ~/.config/waybar:", err)
		return
	}
	err = copyFile("waybar/config", filepath.Join(os.Getenv("HOME"), ".config/waybar/config"))
	if err == nil {
		fmt.Printf("[%s] >>> waybar/config has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying waybar/config:", err)
	}
	err = copyFile("waybar/style.css", filepath.Join(os.Getenv("HOME"), ".config/waybar/style.css"))
	if err == nil {
		fmt.Printf("[%s] >>> waybar/style.css has been installed.\n", time.Now().Format("15:04:05"))
	} else {
		fmt.Println("Error copying waybar/style.css:", err)
	}

	// Check if the system is Arch Linux
	var distro string
	if _, err := os.Stat("/etc/arch-release"); err == nil {
		distro = "Arch Linux"
		installArchLinux()
	} else if _, err := os.Stat("/etc/gentoo-release"); err == nil {
		distro = "Gentoo Linux"
		installGentooLinux()
	} else {
		distro = "Maybe unsupported Linux distribution."
		showUnsupportedMessage()
	}
	fmt.Println("System:", distro)

	// Output a message based on the system language
	outputConfigMessage()
}

func copyFile(src, dst string) error {
	input, err := os.ReadFile(src)
	if err != nil {
		return err
	}
	return os.WriteFile(dst, input, 0644)
}

func copyFiles(srcDir, dstDir string) error {
	files, err := os.ReadDir(srcDir)
	if err != nil {
		return err
	}
	for _, file := range files {
		src := filepath.Join(srcDir, file.Name())
		dst := filepath.Join(dstDir, file.Name())
		err := copyFile(src, dst)
		if err != nil {
			return err
		}
	}
	return nil
}

func installArchLinux() {
	installPackages("pacman", []string{
		"linux-zen", "linux-zen-headers", "hyprland", "hyprlock", "hyprpaper", "hyprcursor", "hyprgraphics", "hyprutils", "waybar", "sddm", "gnome", "alacritty", "fish", "eza", "mission-center", "nautilus", "fcitx5", "rime-double-pinyin", "pipewire", "vlc", "code", "vim", "vi", "nano", "wl-clipboard", "grim",
	}, "--noconfirm")
	installPackages("pacman", []string{"git", "base-devel"}, "--noconfirm")
	cmd := exec.Command("git", "clone", "https://aur.archlinux.org/yay.git", filepath.Join(os.Getenv("HOME"), ".cache/yay"))
	err := cmd.Run()
	if err != nil {
		fmt.Println("Error cloning yay:", err)
		return
	}
	cmd = exec.Command("makepkg", "-si")
	cmd.Dir = filepath.Join(os.Getenv("HOME"), ".cache/yay")
	err = cmd.Run()
	if err != nil {
		fmt.Println("Error installing yay:", err)
		return
	}
	err = os.RemoveAll(filepath.Join(os.Getenv("HOME"), ".cache/yay"))
	if err != nil {
		return
	}

	// Check if AMD GPU is present
	cmd = exec.Command("lspci")
	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Println("Error running lspci:", err)
		return
	}
	if strings.Contains(string(output), "VGA.*AMD") {
		fmt.Println("Detected AMD GPU.")
		installPackages("pacman", []string{"mesa", "lib32-mesa", "xf86-video-amdgpu", "vulkan-radeon", "lib32-vulkan-radeon"}, "--noconfirm")
	}
	// Check if Intel GPU is present
	if strings.Contains(string(output), "VGA.*Intel") {
		fmt.Println("Detected Intel GPU.")
		installPackages("pacman", []string{"mesa", "lib32-mesa", "vulkan-intel", "lib32-vulkan-intel"}, "--noconfirm")
	}
	// Check if NVIDIA GPU is present
	if strings.Contains(string(output), "VGA.*NVIDIA") {
		fmt.Println("Detected NVIDIA GPU.")
		installPackages("pacman", []string{"nvidia", "nvidia-utils"}, "--noconfirm")
	}
}

func installGentooLinux() {
	installPackages("emerge", []string{
		"sys-kernel/linux-zen", "sys-kernel/linux-zen-headers", "x11-wm/hyprland", "x11-misc/hyprlock", "x11-misc/hyprpaper", "x11-misc/hyprcursor", "x11-misc/hyprgraphics", "x11-misc/hyprutils", "x11-misc/waybar", "x11-misc/sddm", "gnome-base/gnome", "x11-terms/alacritty", "shells/fish", "sys-apps/eza", "x11-misc/nautilus", "app-i18n/fcitx5", "app-i18n/rime-double-pinyin", "media-sound/pipewire", "media-video/vlc", "app-editors/vim", "app-editors/vi", "app-editors/nano", "x11-misc/wl-clipboard", "x11-misc/grim",
	}, "--ask")

	// Check if AMD GPU is present
	cmd := exec.Command("lspci")
	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Println("Error running lspci:", err)
		return
	}
	if strings.Contains(string(output), "VGA.*AMD") {
		fmt.Println("Detected AMD GPU.")
		installPackages("emerge", []string{"x11-drivers/xf86-video-amdgpu", "media-libs/mesa", "media-libs/vulkan-radeon"}, "--ask")
	}
	// Check if Intel GPU is present
	if strings.Contains(string(output), "VGA.*Intel") {
		fmt.Println("Detected Intel GPU.")
		installPackages("emerge", []string{"x11-drivers/xf86-video-intel", "media-libs/mesa", "media-libs/vulkan-intel"}, "--ask")
	}
	// Check if NVIDIA GPU is present
	if strings.Contains(string(output), "VGA.*NVIDIA") {
		fmt.Println("Detected NVIDIA GPU.")
		installPackages("emerge", []string{"x11-drivers/nvidia-drivers"}, "--ask")
	}
}

func outputConfigMessage() {
	lang := os.Getenv("LANG")
	langParts := strings.Split(lang, ".")
	mainLang := langParts[0]
	var msg string
	switch mainLang {
	case "zh_CN":
		msg = "配置已安装完毕，请根据自身情况进行调整。"
	case "fr_FR":
		msg = "La configuration a été installée. Veuillez l'ajuster en fonction de votre situation."
	case "de_DE":
		msg = "Die Konfiguration wurde installiert. Bitte anpassen Sie es nach Ihrer Situation."
	case "es_ES":
		msg = "La configuración se ha instalado. Ajuste según su situación."
	case "ru_RU":
		msg = "Возможно, неподдерживаемая дистрибуция Linux."
	case "ja_JP":
		msg = "サポートされていない Linux ディストリビューションの可能性があります。"
	default:
		msg = "The configuration has been installed. Please adjust according to your own situation."
	}
	// 使用 ANSI 转义序列设置绿色输出
	green := "\033[0;32m"
	reset := "\033[0m"
	fmt.Printf("%s%s%s\n", green, msg, reset)
}

func showUnsupportedMessage() {
	lang := os.Getenv("LANG")
	langParts := strings.Split(lang, ".")
	mainLang := langParts[0]
	var msg string
	switch mainLang {
	case "zh_CN":
		msg = "可能不支持的 Linux 发行版。"
	case "fr_FR":
		msg = "Peut-être une distribution Linux non supportée."
	case "de_DE":
		msg = "Möglicherweise nicht unterstützte Linux-Distribution."
	case "es_ES":
		msg = "Posible distribución Linux no soportada."
	case "ru_RU":
		msg = "Возможно, неподдерживаемая дистрибуция Linux."
	case "ja_JP":
		msg = "サポートされていない Linux ディストリビューションの可能性があります。"
	default:
		msg = "Maybe unsupported Linux distribution."
	}
	fmt.Println(msg)
}

func installPackages(packageManager string, packages []string, options ...string) {
	args := append(packages, options...)
	cmd := exec.Command(packageManager, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		fmt.Printf("Error installing packages with %s: %v\n", packageManager, err)
	}
}
