#!/data/data/com.termux/files/usr/bin/bash

# Instalar Proot e outros pacotes necessários
pkg update && pkg upgrade -y
pkg install proot-distro -y

# Instalar Debian dentro do Proot
proot-distro install debian

# Configurar ambiente
echo "Iniciando Debian dentro do Proot..."
proot-distro login debian -- bash -c "apt update && apt install firefox -y"

echo "Instalação concluída! Para iniciar o Firefox, use: ./start_firefox.sh"

echo "execute install_firefox.sh para baixar o Firefox"