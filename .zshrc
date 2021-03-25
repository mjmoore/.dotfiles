# Prompt to start X if not running
if command -v startx &> /dev/null && \ 
   command -v xset &> /dev/null && \ 
   [ ! xset q &> /dev/null ];
then
    while true; do
        read "?Start X server? " yn
        case $yn in
            [Nn]* ) break;;
            * ) startx; break;;
        esac
    done
else
# If running inside X, attach tmux
    tmux attach &> /dev/null
    if [[ ! $TERM =~ screen ]]; then
        exec tmux -2
    fi
fi	

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Manually use `omz update` instead
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git fzf ssh-agent colored-man-pages)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export BROWSER=firefox

export VIMINIT="source $HOME/.config/vim/vimrc"

alias stash="git stash"
alias unstash="git stash apply stash@{0}"
