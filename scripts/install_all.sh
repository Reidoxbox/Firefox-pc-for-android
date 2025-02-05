#!/data/data/com.termux/files/usr/bin/bash

echo "Atualizando pacotes do Termux..."
pkg update -y && pkg upgrade -y

echo "Instalando dependências necessárias..."
pkg install -y proot-distro wget unzip pulseaudio

echo "Instalando Debian no Proot..."
proot-distro install debian

echo "Baixando e instalando o XServer..."
bash scripts/install_xserver.sh

echo "Instalando o Firefox..."
bash scripts/install_firefox.sh

echo "Instalando extensões no Firefox..."
bash scripts/install_extensions.sh
bash scripts/install_extensions_2.sh

echo "Instalação concluída! Para iniciar, execute: bash scripts/start.sh"
