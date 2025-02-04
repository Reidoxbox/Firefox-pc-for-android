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

# Instalar o Firefox
# Criar diretório para o Firefox
mkdir -p ~/firefox

# Baixar o Firefox mais recente (versão Linux 64 bits)
wget -O ~/firefox/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=pt-BR"

# Extrair os arquivos
tar xjf ~/firefox/firefox.tar.bz2 -C ~/firefox --strip-components=1

# Criar um atalho para execução
ln -sf ~/firefox/firefox ~/usr/bin/firefox