#!/bin/bash

# Criar a pasta de extensões, se não existir
EXT_DIR="$HOME/.mozilla/firefox/*.default-release/extensions"
mkdir -p "$EXT_DIR"

# Lista de extensões (adicione mais se quiser)
EXTENSIONS=(
  "https://addons.mozilla.org/firefox/downloads/file/4106538/ublock_origin-latest.xpi"  # uBlock Origin
  "https://addons.mozilla.org/firefox/downloads/file/4105424/darkreader-latest.xpi"  # Dark Reader
)

# Baixar e instalar cada extensão
for EXT in "${EXTENSIONS[@]}"; do
  wget -O "$EXT_DIR/$(basename $EXT)" "$EXT"
done

echo "Extensões instaladas com sucesso!"
