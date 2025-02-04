#!/data/data/com.termux/files/usr/bin/bash

echo "Baixando e instalando o XServer APK..."

# Criar diretório temporário
mkdir -p ~/xserver-apk && cd ~/xserver-apk

# Baixar o APK do XServer
wget -O xserver.apk "https://github.com/Reidoxbox/Firefox-pc-for-android/releases/tag/1.0"

# Instalar o APK
pm install xserver.apk

echo "XServer instalado com sucesso! Abra o aplicativo e inicie o servidor."