# Criar pasta para o Firefox
mkdir -p ~/firefox-appimage && cd ~/firefox-appimage

# Baixar a versão mais recente
wget -O firefox.AppImage "https://github.com/srevinsaju/Firefox-Appimage/releases/latest/download/firefox-x86_64.AppImage"

# Dar permissão de execução
chmod +x firefox.AppImage

# Rodar o Firefox
./firefox.AppImage

# Instalar Flatpak
apt install -y flatpak

# Adicionar o repositório Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalar o Firefox via Flatpak
flatpak install -y flathub org.mozilla.firefox

flatpak run org.mozilla.firefox