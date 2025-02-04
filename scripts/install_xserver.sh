#!/data/data/com.termux/files/usr/bin/bash

# Atualizar pacotes do Termux
echo "Atualizando pacotes..."
pkg update && pkg upgrade -y

# Perguntar ao usuário qual método gráfico deseja instalar
echo "Escolha o método gráfico:"
echo "1) XServer XSDL (mais leve)"
echo "2) XFCE Desktop (mais estável, requer VNC)"
read -p "Opção (1 ou 2): " GRAFICO

if [[ "$GRAFICO" == "1" ]]; then
    # Instalar XServer XSDL
    echo "Instalando XServer XSDL..."
    pkg install x11-repo -y
    pkg install xwayland pulseaudio -y
    
    # Baixar e instalar o APK do XServer
    echo "Baixando e instalando o XServer APK..."
    wget -O xserver.apk "https://github.com/Reidoxbox/Firefox-pc-for-android/releases/download/1.0/xserver-xsdl-1-20-51.apk"
    am start -n x.org.server/.MainActivity

elif [[ "$GRAFICO" == "2" ]]; then
    # Instalar XFCE
    echo "Instalando XFCE Desktop..."
    pkg install git -y
    git clone https://github.com/Yisus7u7/termux-desktop-xfce.git
    cd termux-desktop-xfce
    bash install.sh
    echo "Instalação concluída! Para iniciar o XFCE, use o comando: startxfce4"
else
    echo "Opção inválida. Saindo..."
    exit 1
fi

echo "Instalação concluída com sucesso!"
