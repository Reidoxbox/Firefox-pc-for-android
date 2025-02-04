#!/data/data/com.termux/files/usr/bin/bash

echo "Baixando e instalando o XServer APK..."

# Criar diretório temporário
mkdir -p ~/xserver-apk && cd ~/xserver-apk

# URL do ZIP contendo o APK no GitHub Releases
ZIP_URL="https://github.com/Reidoxbox/Firefox-pc-for-android/releases/tag/1.0"

# Baixar o arquivo ZIP do XServer
wget -O xserver.zip "$ZIP_URL"

# Descompactar o ZIP
unzip xserver.zip

# Encontrar o APK descompactado e instalar
APK_FILE=$(find . -name "*.apk" | head -n 1)
if [ -f "$APK_FILE" ]; then
    pm install "$APK_FILE"
    echo "XServer instalado com sucesso! Abra o aplicativo e inicie o servidor."
else
    echo "Erro: APK não encontrado no ZIP!"
    exit 1
fi