#!/data/data/com.termux/files/usr/bin/bash

# Perguntar ao usuário qual DISPLAY deseja usar (0 ou 1)
while true; do
    read -p "Escolha o número do DISPLAY (0 ou 1): " DISPLAY
    if [[ "$DISPLAY" == "0" || "$DISPLAY" == "1" ]]; then
        break
    else
        echo "Opção inválida! Digite 0 ou 1."
    fi
done

# Perguntar ao usuário o endereço do PULSE SERVER
read -p "Digite o endereço do PULSE SERVER (padrão: 127.0.0.1): " PULSE_SERVER
PULSE_SERVER=${PULSE_SERVER:-127.0.0.1}  # Se vazio, usa 127.0.0.1

# Configurar variáveis de ambiente
export DISPLAY=":$DISPLAY"
export PULSE_SERVER="$PULSE_SERVER"

# Iniciar o XServer
echo "Iniciando XServer..."
am start -n x.org.server/.MainActivity

# Aguardar 5 segundos para o XServer iniciar
sleep 5

# Iniciar Debian dentro do Proot e rodar o Firefox
echo "Iniciando Debian dentro do Proot..."
proot-distro login debian -- bash -c "
    export DISPLAY=$DISPLAY
    export PULSE_SERVER=$PULSE_SERVER
    echo 'Verificando se o Firefox está instalado...'

    if [ -f ~/firefox-appimage/firefox.AppImage ]; then
        echo 'Iniciando o Firefox...'
        chmod +x ~/firefox-appimage/firefox.AppImage
        ~/firefox-appimage/firefox.AppImage --no-sandbox &
    elif command -v firefox &> /dev/null; then
        echo 'Iniciando o Firefox instalado via pacote...'
        firefox --verbose &
    else
        echo 'Erro: O Firefox não está instalado. Execute install_firefox.sh e tente novamente.'
        exit 1
    fi
"

echo "Firefox iniciado com sucesso!"
