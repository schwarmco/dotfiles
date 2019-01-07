#! /bin/bash

usage='Usage: ./install.sh [-n] [-f] app1 [app2 app3 ..]
  -n   dry-run; no filesystem changes
  -f   force overwrite of existing symlinks'

DRY_RUN=0
FORCE=0

while getopts 'nf' opts
do
	case $opts in
		n ) DRY_RUN=1;;
		f ) FORCE=1;;
		* ) echo "$usage"
			exit 1;;
	esac
done
shift $((OPTIND-1))

if ! command -v stow >/dev/null 2>&1; then
    echo 'Please install stow and try again'
    exit 1
fi

for app in "$@"
do
    if [[ $FORCE -eq 1 ]]; then
        CONFLICTS=$(stow -nv -t $HOME "$app" 2>&1 | awk '/\* existing target is/ {print $NF}')
        if [ ! -z $CONFLICTS ]; then
            echo "Found existing dotfiles:"
            echo "$CONFLICTS"
            read -r -p "Are you sure to overwrite? [y/N] " OVERWRITE
            case "$OVERWRITE" in
                [yY][eE][sS]|[yY])
                    for filename in $CONFLICTS; do
                        if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
			                echo "Deleting file $HOME/$filename"
            			    if [[ $DRY_RUN -eq 0 ]]; then
                				rm -f "$HOME/$filename"
            			    fi
                        fi
                    done
                    ;;
                *)
                    echo "Aborting..."
                    exit 0
                    ;;
            esac
        fi
    fi

    # restow when force flag supplied
    if [[ $FORCE -eq 1 ]]; then RESTOW='--restow'; else RESTOW=''; fi
    if [[ $DRY_RUN -eq 1 ]]; then DR='-n'; else DR=''; fi

    # use stow to create symlinks in $HOME
    stow -v --ignore='install.sh' "$app" $RESTOW --target="$HOME" $DR

    if [[ $? -ne 0 && $DRY_RUN -eq 0 ]]; then
        echo 'Stow returned a non-zero result. You may want to re-run with -f (force)'
    fi
done
