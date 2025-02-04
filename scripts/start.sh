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

# Aguardar até que o XServer esteja rodando
echo "Verificando se o XServer iniciou..."
sleep 5
if ! pgrep -f X ; then
    echo "Erro: O XServer não iniciou. Verifique se ele está instalado e tente novamente."
    exit 1
fi

# Iniciar Debian dentro do Proot e rodar o Firefox
echo "Iniciando Debian dentro do Proot..."
proot-distro login debian -- bash -c "
    export DISPLAY=$DISPLAY
    export PULSE_SERVER=$PULSE_SERVER
    echo 'Verificando se o Firefox está instalado...'
    
    if ! command -v firefox &> /dev/null; then
        echo 'Erro: O Firefox não está instalado dentro do Debian. Execute install_firefox.sh e tente novamente.'
        exit 1
    fi

    echo 'Iniciando o Firefox...'
    sleep 2
    firefox --verbose &
"

echo "Firefox iniciado com sucesso!"
