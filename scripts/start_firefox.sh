#!/data/data/com.termux/files/usr/bin/bash

# Iniciar Debian e executar o Firefox
proot-distro login debian -- bash -c "firefox"

# Criar pasta para o Firefox AppImage
mkdir -p ~/firefox-appimage && cd ~/firefox-appimage

# Baixar a versão mais recente do Firefox AppImage
wget -O firefox.appimage "https://github.com/srevinsaju/Firefox-Appimage/releases/latest/download/firefox-x86_64.AppImage"

# Dar permissão de execução
chmod +x firefox.appimage

# Rodar o Firefox AppImage
./firefox.appimage