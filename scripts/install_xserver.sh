#!/bin/bash

# URL direta para o XServer ZIP (atualize com o link correto)
XSERVER_URL="https://github.com/Reidoxbox/Firefox-pc-for-android/releases/download/1.0/xserver.zip"

# Criar pasta temporária e baixar
mkdir -p ~/xserver-install
cd ~/xserver-install
wget -O xserver.zip "$XSERVER_URL"

# Verificar se o arquivo foi baixado corretamente
if [ ! -f "xserver.zip" ]; then
    echo "Erro: Falha no download do XServer!"
    exit 1
fi

# Descompactar o ZIP
unzip xserver.zip || { echo "Erro: Falha ao descompactar o XServer!"; exit 1; }

# Instalar o APK do XServer
APK_FILE=$(find . -name "*.apk" | head -n 1)
if [ -z "$APK_FILE" ]; then
    echo "Erro: APK não encontrado no ZIP!"
    exit 1
fi

echo "Instalando o APK do XServer..."
pm install "$APK_FILE"

# Limpar arquivos temporários
cd ..
rm -rf ~/xserver-install

echo "Instalação do XServer concluída!"
