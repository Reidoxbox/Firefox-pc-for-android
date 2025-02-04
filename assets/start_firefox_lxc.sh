#!/data/data/com.termux/files/usr/bin/bash

# Iniciar container e abrir Firefox
lxc-start -n meu-container
lxc-attach -n meu-container -- firefox