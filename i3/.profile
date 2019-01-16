# set vim as editor
export EDITOR="vim"

# set gopath
export GOPATH="$HOME/Code"

# add gopath/src as a cdpath, so you can `cd github.com/schwarmco` etc. from anywhere
export CDPATH=".:$GOPATH/src"

# set gopath/bin as path, so we can execute installed go programs
export PATH="$PATH:$GOPATH/bin"

# source nvm (node version manager)
source /usr/share/nvm/init-nvm.sh
