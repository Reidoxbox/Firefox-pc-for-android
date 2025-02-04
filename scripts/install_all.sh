#!/data/data/com.termux/files/usr/bin/bash

echo "Iniciando instalação completa do Firefox no Android..."

# Definir caminho do diretório do projeto
PROJECT_DIR="$HOME/Firefox-pc-for-android/scripts"

# Garantir que os scripts são executáveis
chmod +x $PROJECT_DIR/*.sh

# Instalar Debian no Proot
echo "Instalando Debian no Proot..."
bash $PROJECT_DIR/install_debian_proot.sh || { echo "Erro na instalação do Debian!"; exit 1; }

# Instalar Firefox
echo "Instalando o Firefox..."
bash $PROJECT_DIR/install_firefox.sh || { echo "Erro na instalação do Firefox!"; exit 1; }

# Instalar Extensões do Firefox
echo "Instalando Extensões..."
bash $PROJECT_DIR/install_extensions.sh || { echo "Erro na instalação das extensões!"; exit 1; }

bash $PROJECT_DIR/install_xserver.sh || { acho "ERRO, ERRO NO XSERVERRRR!!!"; exit 1; }

# Criar pasta para o Firefox
mkdir -p ~/firefox-appimage && cd ~/firefox-appimage

# Baixar a versão oficial do Firefox
wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"

# Extrair o arquivo
tar xjf firefox.tar.bz2

# Mover para um diretório padrão
mv firefox ~/firefox

# Criar um link simbólico para facilitar a execução
ln -s ~/firefox/firefox ~/.local/bin/firefox

# Testar se o Firefox abre
~/firefox/firefox &
