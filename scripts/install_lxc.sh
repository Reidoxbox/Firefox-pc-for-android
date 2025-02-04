#!/data/data/com.termux/files/usr/bin/bash

# Instalar LXC no Termux
pkg update && pkg upgrade -y
pkg install lxc -y

# Criar container Debian
lxc-create -t download -n meu-container -- --dist debian --release bookworm --arch arm64

# Iniciar e instalar Firefox
lxc-start -n meu-container
lxc-attach -n meu-container -- apt update
lxc-attach -n meu-container -- apt install firefox -y

echo "Container LXC configurado! Use ./start_firefox_lxc.sh para rodar o Firefox."