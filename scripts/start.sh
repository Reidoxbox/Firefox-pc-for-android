#!/data/data/com.termux/files/usr/bin/bash

# Perguntar ao usuário qual DISPLAY deseja usar
echo "Escolha o número do DISPLAY (0 ou 1):"
read -p "DISPLAY=: " DISPLAY

# Perguntar ao usuário o endereço do PULSE SERVER
read -p "Digite o endereço do PULSE SERVER (padrão: 127.0.0.1): " PULSE_SERVER
PULSE_SERVER=${PULSE_SERVER:-127.0.0.1}  # Se vazio, usa 127.0.0.1

# Configurar variáveis de ambiente
export DISPLAY=":$DISPLAY"
export PULSE_SERVER="$PULSE_SERVER"

# Iniciar o XServer
echo "Iniciando XServer..."
am start --user 0 -n x.org.server/x.org.server.RunMainActivity

# Esperar o XServer iniciar (5 segundos)
sleep 5

# Iniciar Debian dentro do Proot e rodar o Firefox
echo "Iniciando Debian dentro do Proot..."
proot-distro login debian -- bash -c "
    export DISPLAY=$DISPLAY
    export PULSE_SERVER=$PULSE_SERVER
    ~/firefox/firefox &
"

echo "Firefox iniciado com sucesso!"
