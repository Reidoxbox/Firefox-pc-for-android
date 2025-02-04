#!/data/data/com.termux/files/usr/bin/bash

# Atualizar pacotes e instalar Proot
pkg update && pkg upgrade -y
pkg install -y proot-distro

# Instalar Debian no Proot
proot-distro install debian

# Instalar o Firefox dentro do Debian
echo "Iniciando Debian e instalando Firefox..."
proot-distro login debian -- bash -c "apt update && apt install -y firefox"

echo "Instalação concluída! Para iniciar o Firefox, use: ./start_firefox.sh"
echo "Execute install_firefox.sh para baixar o Firefox via Flatpak."
