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
PULSE_SERVER=${PULSE_SERVER:-127.0.0.1}

# Configurar variáveis de ambiente
export DISPLAY=":$DISPLAY"
export PULSE_SERVER="$PULSE_SERVER"

# Verificar se o Ubuntu está instalado no Proot
if ! proot-distro list | grep -q "ubuntu"; then
    echo "Erro: O Ubuntu não está instalado no Proot. Instalando automaticamente..."
    proot-distro install ubuntu
fi

# Iniciar o XServer
echo "Iniciando XServer..."
am start -n x.org.server/.MainActivity

# Aguardar 5 segundos para o XServer iniciar
sleep 5

# Iniciar Ubuntu dentro do Proot e rodar o Firefox
echo "Iniciando Ubuntu dentro do Proot..."
proot-distro login ubuntu -- bash -c "
    export DISPLAY=$DISPLAY
    export PULSE_SERVER=$PULSE_SERVER
    echo 'Verificando se o Firefox está instalado...'

    if ! command -v firefox &> /dev/null; then
        echo 'Erro: O Firefox não está instalado dentro do Ubuntu. Instalando agora...'
        apt update && apt install -y firefox
    fi

    echo 'Iniciando o Firefox...'
    firefox --no-sandbox --verbose &
"

echo "Firefox iniciado com sucesso!"
