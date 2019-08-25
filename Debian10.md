# My Setup of Debian 10 on a Thinkpad T60

After installing Debian 10 (without desktop environment), these are the steps, to get the system up and running to a point, where i can `git-stow` this repository and have my usual setup.

## Basic Packages

```bash
su -
apt install sudo vim git
adduser js sudo
```

## Installing i3

```bash
apt install i3
git clone https://github.com/maestrogerardo/i3-gaps-deb && cd i3-gaps-deb
chmod +x i3-gaps-deb
./i3-gaps-deb

echo "exec i3" > ~/.xinitrc
sudo apt install xserver-xorg xinit
```

## Installing Fonts, Theme, etc.

```bash
sudo apt install x11-xserver-utils

git clone https://github.com/adobe-fonts/source-code-pro
sudo cp source-code-pro/TTF/*.ttf /usr/local/share/fonts/
rm -rf source-code-pro

git clone https://github.com/FortAwesome/Font-Awesome
sudo cp Font-Awesome/otfs/*.otf /usr/local/share/fonts/
rm -rf Font-Awesome

# only the Mono SC is needed, so cloning the gitrepo is overkill
wget https://github.com/googlefonts/noto-cjk/raw/master/NotoSansMonoCJKsc-Regular.otf
sudo mv NotoSansMonoCJKsc-Regular.otf /usr/local/share/fonts/
rm NotoSansMonoCJKsc-Regular.otf

sudo fc-cache
```

## Installing i3-related Apps

```bash
sudo apt install build-essential cmake
sudo apt install libcurl4-openssl-dev libpulse-dev libiw-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-ewmh-dev
git clone https://github.com/jaagr/polybar
cd polybar && ./build.sh

# modules i've chosen (and the dependencies up there relate to):
# i3, pulseaudio, network, github, ipc

sudo apt install python3-dbus # for the polybar-spotify-plugin

sudo apt install rofi feh
```

## Mounting Vault

```bash
sudo apt install cifs-utils
sudo mkdir -p /mnt/vault/joachim
sudo mount -t cifs -o user=joachim,uid=js,gid=js //vault.local/joachim /mnt/vault/jocahim
```

## Setting Identity & Security

```bash
cp -r /mnt/vault/joachim/backup/home/js/.gnupg ~/
sudo apt install libpcsclite1 pcscd gnupg-agent scdaemon
```
