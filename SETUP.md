# SETUP

The following steps are things, i've did after completely re-installing my system.

Ubuntu 18.10

**Installing GnuPG & Yubikey Setup**

```
# mount /vault/joachim to /mnt
cp -r /mnt/backup/home/js/.gnupg ~/
cp -r /mnt/backup/home/js/.ssh ~/
sudo apt install gnupg-agent gnupg2 pinentry-gtk2 scdaemon libccid pcscd libpcsclite1 gpgsm
```

**Setting up i3**

```
# follow this guide for i3-gaps: https://github.com/Airblader/i3/wiki/Compiling-&-Installing
# polybar:
cd ~/Downloads # grep latest release from https://github.com/jaagr/polybar/releases
tar xf polybar-<ver>.tar && cd polybar
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2
./build.sh
# 
sudo apt install feh dunst rofi
```

**Grabbing all my Configs**

```
mkdir -p ~/Code/src/github.com/schwarmco && cd "$_"
git clone git@github.com:schwarmco/dotfiles.git && cd dotfiles
sudo apt install stow make
make
```

**Install Font**

```
# grab Ubuntu Mono Nerd Font from nerdfonts.com & put into .fonts
fc-cache -fv
```

**Configure E-Mail**

```
sudo apt install offlineimap msmtp neomutt
cp -r /mnt/backup/home/js/Mail ~/
systemctl --user enable offlineimap.timer # (from .config/systemd/user)
systemctl --user start offlineimap.timer
```

**Install Utilities**
```
sudo apt install vifm curl
# download and install KeeWeb @ https://keeweb.info
```

**Setup VS Code**
```
# download from https://code.visualstudio.com/Download and install
# install extensions:
# - golf1052.base16-generator
```