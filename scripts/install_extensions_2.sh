#!/bin/bash

# Verificar e instalar pacotes necessários
echo "Verificando dependências..."

# Função para verificar e instalar pacotes no Termux e Debian Proot
install_pkg() {
    if command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y "$1"
    elif command -v pkg &>/dev/null; then
        pkg update && pkg install -y "$1"
    else
        echo "Gerenciador de pacotes não suportado."
        exit 1
    fi
}

# Instalar wget, caso não esteja instalado
if ! command -v wget &>/dev/null; then
    echo "wget não encontrado. Instalando..."
    install_pkg wget
else
    echo "wget já está instalado."
fi

# Criar pasta de extensões
EXT_DIR="$HOME/.mozilla/firefox/*.default-release/extensions"
mkdir -p "$EXT_DIR"

# Lista de extensões para baixar
EXTENSIONS=(
  "https://addons.mozilla.org/firefox/downloads/file/4106538/ublock_origin-latest.xpi"
  "https://addons.mozilla.org/firefox/downloads/file/4105424/darkreader-latest.xpi"
)

# Baixar e instalar extensões
echo "Baixando extensões..."
for EXT in "${EXTENSIONS[@]}"; do
    wget -O "$EXT_DIR/$(basename $EXT)" "$EXT"
done

echo "Extensões instaladas com sucesso!"