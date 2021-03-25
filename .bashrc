# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\h\[\033[1;34m\] \W |>\[\033[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\h\W|> '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

####################
# KITTY COMPLETION #
####################
source <(kitty + complete setup bash)

########
# RUST #
########
export PATH="$HOME/.cargo/bin:$PATH"

######
# GO #
######
export GOPATH="$HOME/Repos/go"
export PATH=$PATH:$(go env GOPATH)/bin

########
# PASS #
########
alias pass-pull='pass git pull origin master'
alias pass-push='pass git push origin master'

########
# REPOS #
########
#alias dijo-pull='git -C ${HOME}/.local/share/dijo pull origin master'
#alias dijo-push='git -C ${HOME}/.local/share/dijo add -A && git -C ${HOME}/.local/share/dijo commit --allow-empty-message -m "" && git -C ${HOME}/.local/share/dijo push origin master'

##################
# PACMAN ALIASES #
##################
alias remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias list-size="pacman -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | sort -h"

###############
# EMPTY TRASH #
###############
alias empty-trash='rm -rf ${HOME}/.local/share/Trash/files/*'
alias list-trash='ls ${HOME}/.local/share/Trash/files'

#############
# SET ICONS #
#############
alias set-icons='sudo sh ${HOME}/Repos/archdots/install-scripts/set-icons.sh'

##########
# EDITOR #
##########
export EDITOR=nvim
export VISUAL=nvim

########
# MESA #
########
# set MESA_DIR to be the directory to which you downloaded MESA
export MESA_DIR=${HOME}/Repos/mesa-r12778

# set OMP_NUM_THREADS to be the number of cores on your machine
export OMP_NUM_THREADS=10

# you should have done this when you set up the MESA SDK
export MESASDK_ROOT=${HOME}/Repos/mesasdk
source $MESASDK_ROOT/bin/mesasdk_init.sh

# new star work
alias new-mesa='cp -r $MESA_DIR/star/work'
alias new-mesa-profile='cp $MESA_DIR/star/defaults/profile_columns.list'
alias new-mesa-history='cp $MESA_DIR/star/defaults/history_columns.list'
alias mesa-vars='nvim $MESA_DIR/star_data/public/star_data.inc'

