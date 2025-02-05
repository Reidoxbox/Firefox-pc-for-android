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

# Aguardar o XServer iniciar
echo "Esperando o XServer iniciar..."
sleep 5

# Verificar se o Proot-Distro está instalado
if ! command -v proot-distro &> /dev/null; then
    echo "Erro: Proot-Distro não está instalado. Execute install_all.sh primeiro."
    exit 1
fi

# Verificar se o Ubuntu está instalado
if ! proot-distro list | grep -q "ubuntu"; then
    echo "Erro: O Ubuntu não está instalado no Proot-Distro. Execute install_debian_proot.sh e tente novamente."
    exit 1
fi

# Iniciar o Ubuntu dentro do Proot e rodar o Firefox
echo "Iniciando Ubuntu dentro do Proot..."
proot-distro login ubuntu -- bash -c "
    export DISPLAY=$DISPLAY
    export PULSE_SERVER=$PULSE_SERVER

    # Verificar se o Firefox está instalado
    if ! command -v firefox &> /dev/null; then
        echo 'Erro: O Firefox não está instalado dentro do Ubuntu. Execute install_firefox.sh e tente novamente.'
        exit 1
    fi

    echo 'Iniciando o Firefox...'
    sleep 2
    firefox --verbose &
"

echo "Firefox iniciado com sucesso!"
