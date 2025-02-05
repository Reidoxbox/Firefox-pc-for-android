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


#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando o Ubuntu no Proot..."

# Verifica se o proot-distro está instalado
if ! command -v proot-distro &> /dev/null; then
    echo "Instalando o proot-distro..."
    pkg install -y proot-distro
fi

# Instalar o Ubuntu no Proot
proot-distro install ubuntu

# Verificar se a instalação foi bem-sucedida
if proot-distro list | grep -q "ubuntu"; then
    echo "Ubuntu instalado com sucesso no Proot!"
else
    echo "Erro: A instalação do Ubuntu falhou."
    exit 1
fi

echo "Atualizando pacotes no Ubuntu..."
proot-distro login ubuntu -- bash -c "
    apt update && apt upgrade -y
    apt install -y firefox pulseaudio x11-utils
"

echo "Instalação concluída! Agora você pode executar o Start.sh para rodar o Firefox."
