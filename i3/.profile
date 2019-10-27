# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# start X, if logging on to tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then 
    exec startx
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set vim as editor
export EDITOR="vim"

# golang specific exports
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME"
export CDPATH=".:$GOPATH/src" # add gopath/src as cd-able like `cd github.com/schwarmco`
export PATH="$PATH:$GOPATH/bin" # add gopath/bin as executable path

# add .local/bin (for aws cli)
export PATH="$PATH:~/.local/bin"

# cleaning $HOME by forcing apps to XDG standard
export XDG_CONFIG_HOME="$HOME/.config"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
# export NVM_DIR="$XDG_DATA_HOME/nvm"
# export UNISON="$XDG_CONFIG_HOME/unison"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# source nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source /usr/share/nvm/init-nvm.sh

#export KEYID="A0FDBCC6B6F981D1"
#export GPG_TTY="$(tty)"
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpgconf --launch gpg-agent
#gpg-connect-agent updatestartuptty /bye

# pinyin
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -drx

alias ls='ls -hN --color=auto --group-directories-first'
alias publicip='curl ipinfo.io/ip'
