# My Setup of Debian 10 on a Thinkpad T60

After installing Debian 10 (without desktop environment), these are the steps, to get the system up and running to a point, where i can `git-stow` this repository and have my usual setup.

## Basic Packages

```bash
su
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
sudo cp source-code-pro/TTF/*.ttf /usr/local/share/fonts
rm -rf source-code-pro
sudo fc-cache
```