#!/data/data/com.termux/files/usr/bin/bash

echo "Organizando arquivos e iniciando o Firefox no container..."

# Criar diretório do container
mkdir -p ~/firefox-container && cd ~/firefox-container

# Mover arquivos necessários para o container
cp -r ~/firefox-appimage ~/firefox-container/
cp -r ~/.mozilla ~/firefox-container/

# Configurar e iniciar o XServer
export DISPLAY=:0
export DISPLAY=:1
echo "export DISPLAY=:0" >> ~/.bashrc
source ~/.bashrc

# Iniciar o Firefox no container
proot-distro login debian -- bash -c "~/firefox-container/firefox-appimage/firefox.AppImage"