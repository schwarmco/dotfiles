# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# add /usr/local/go/bin to path
export PATH=$PATH:/usr/local/go/bin

# set gopath
export GOPATH="$HOME/Code"

# add gopath/src as a cdpath, so you can `cd github.com/schwarmco` etc. from anywhere
export CDPATH=".:$GOPATH/src"

# set gopath/bin as path, so we can execute installed go programs
export PATH="$PATH:$GOPATH/bin"

# add .local/bin (for aws cli)
export PATH="$PATH:~/.local/bin"

# source nvm (node version manager)
# source /usr/share/nvm/init-nvm.sh

# pinyin
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -drx
