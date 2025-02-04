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

# Iniciar Firefox
echo "Iniciando o Firefox..."
bash $PROJECT_DIR/start_firefox.sh || { echo "Erro ao iniciar o Firefox!"; exit 1; }

echo "Instalação completa! O Firefox está pronto para uso."