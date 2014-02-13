# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

# virtualenvwrapper stuff.
export WORKON_HOME=~/Envs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
# Things for python virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Git branch name
function parse_git_branch () {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[1;32m\]"
WHITE="\[\033[0m\]"
BLUE="\[\033[1;34m\]"
  
PS1="$GREEN\u@\h$BLUE:\w$YELLOW\$(parse_git_branch)$WHITE\$ "

# Python laziness
alias py='python'

# Go to common directories
alias js='cd ~/projects/monetization/monetization/apps/whiteRabbit/templates/js/'
alias jstrials='cd ~/projects/monetization/monetization/apps/whiteRabbit/templates/jsTrials/'
alias manage='cd ~/projects/monetization/monetization/'
alias app='cd ~/projects/monetization/monetization/apps/whiteRabbit/'
alias conduit='cd ~/projects/Monetization/monetization/apps/couponBuddyToolbars/templates/conduit'
alias elasticsearch='cd ~/tools/elasticsearch-0.90.5/bin'
alias honeytree='cd ~/projects/honeytree'
alias report='cd ~/projects/ebay-analyzer'
alias downloads='cd ~/downloads'
alias projects='cd ~/projects'
alias eslog='vim /var/log/elasticsearch/HoneyTree.log'

# Run django manange commands
alias go='workon socialingot; python manage.py runserver 0.0.0.0:3232'
alias trials='workon socialingot; python manage.py test --nologcapture monetization.apps.whiteRabbit -s'
alias localsettings='cp ~/projects/white_rabbit_local_settings.py ./settings/local_settings_api.py; cp ~/projects/white_rabbit_local_settings.py ./settings/local_settings_cbapp.py; cp ~/projects/white_rabbit_local_settings.py ./settings/local_settings_white_rabbit.py; cp ~/projects/white_rabbit_local_settings.py ./settings/local_settings_honey_tree.py'

# Kill of my proceses (useful once in a while because disconnects don't kill them)
alias killall='pkill -u zhangb'

# cd aliases
alias ..="cd .."        #go to parent dir
alias ...="cd ../.."    #go to grandparent dir
alias ....="cd ../../.."    #go to great-grandparent dir
alias .....="cd ../../../.."    #go to great-great-grandparent dir

# rc files
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"

# Search for word in files
search () { find . | xargs grep "$@"; }

# Start in js directory
cd ~/projects
