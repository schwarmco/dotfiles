# My Setup of Debian 10 on a Thinkpad T60

After installing Debian 10 (without desktop environment), these are the steps, to get the system up and running to a point, where i can `git-stow` this repository and have my usual setup.
 
## Basic Packages

```bash
su -
apt install sudo vim git zsh
adduser js sudo
exit
# re-login as js to make sudo work
```

## Installing i3

```bash
sudo su
apt install i3
git clone https://github.com/maestrogerardo/i3-gaps-deb && cd i3-gaps-deb
chmod +x i3-gaps-deb
./i3-gaps-deb
cd ..
rm -rf i3-gaps-deb
exit

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

## Getting my Dotfiles

```bash
sudo apt install stow

mkdir -p ~/src/github.com/schwarmco
cd $_
git clone http://github.com/schwarmco/dotfiles.git
cd dotfiles

./install -f i3
./install -f polybar
./install -f vim
```

## Install Lukes st

```
mkdir ~/src/github.com/LukeSmithxyz
cd $_
git clone https://github.com/LukeSmithxyz/st.git
cd st
sudo make install
```

## Install Oh-My-Zsh

```
wget https://raw.githubusercontent.com/robbyrussel/oh-my-zsh/master/tools/install.sh
chmod +x install.sh
ZSH=~/.config/oh-my-zsh ./install.sh

# install autosuggest plugin
cd ~/.config/oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions

# install dotfiles
cd ~/src/github.com/schwarmco/dotfiles
./install -f zsh
```

## Install Brave

```
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ trusty main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-trusty.list
sudo apt update
sudo apt install brave-browser
```

https://eu25.lightning.force.com/lightning/setup/ApexPages/page?address=%2F06657000000cF6V

https://eu25.lightning.force.com/lightning/setup/ApexPages/page?address=%2F06657000000cF6X
https://eu25.lightning.force.com/lightning/setup/ApexClasses/page?address=%2F01p57000000cNj1


## Mounting Vault

```bash
sudo apt install cifs-utils
sudo mkdir -p /mnt/vault/joachim
sudo mount -t cifs -o user=joachim,uid=js,gid=js //vault.local/joachim /mnt/vault/joachim
```

## Setting Identity & Security

```bash
cp -r /mnt/vault/joachim/backup/home/js/.gnupg ~/
sudo apt install libpcsclite1 pcscd gnupg-agent scdaemon
```
