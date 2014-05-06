# ~/.bashrc

shopt -s autocd               # cd by naming directory
shopt -s histappend           # append to the history file, don't overwrite it
shopt -s checkwinsize         # update the value of LINES and COLUMNS after each command
shopt -s expand_aliases       # expand aliases
shopt -s hostcomplete         # attempt hostname expansion when @ is at the beginning of a word
shopt -s dotglob              # include dotfiles in pathname expansion

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export TERM=xterm-256color              # Make the terminal use 256 colors instead of the default 8
export EDITOR=vim

PATH=$PATH:$HOME/scripts

# History
HISTCONTROL=ignorespace      # don't put duplicate lines in the history.
HISTSIZE=10000
HISTFILESIZE=2000
PROMPT_COMMAND='history -a'             # share history across all terminals

#COLORS
  # regular colors
  BLACK="\[\033[0;30m\]"    # black
  RED="\[\033[0;31m\]"      # red
  GREEN="\[\033[0;32m\]"    # green
  YELLOW="\[\033[0;33m\]"   # yellow
  BLUE="\[\033[0;34m\]"     # blue
  MAGENTA="\[\033[0;35m\]"  # magenta
  CYAN="\[\033[0;36m\]"     # cyan
  WHITE="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  BBLACK="\[\033[1;30m\]"
  BRED="\[\033[1;31m\]"
  BGREEN="\[\033[1;32m\]"
  BYELLOW="\[\033[1;33m\]"
  BBLUE="\[\033[1;34m\]"
  BMAGENTA="\[\033[1;35m\]"
  BCYAN="\[\033[1;36m\]"
  BWHITE="\[\033[1;37m\]"

  # reset
  RESET="\[\033[0;37m\]"
  
TEXT_USERNAME='\u'
TEXT_AT=' at '
TEXT_HOSTNAME='\h'
TEXT_IN=' in '
TEXT_WORKING_DIRECTORY='\w'

if [ "$UID" == 0 ] || [ $TEXT_USERNAME == "root" ] ; then
    COLOR_USERNAME=$BRED
else
    COLOR_USERNAME=$YELLOW
fi

if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
    COLOR_HOSTNAME=$BCYAN
else
    COLOR_HOSTNAME=$BGREEN
fi

COLOR_WORKING_DIRECTORY=$BYELLOW
COLOR_BRANCH=$BMAGENTA

# Git completion and branch info
. ~/.dotfiles/bash/lib/git-completion.bash

function __git_prompt {
  GIT_PS1_SHOWDIRTYSTATE=1
  __git_ps1 "%s" | sed 's/ \([+*]\{1,\}\)$/\1/' | sed 's/^/ on /g'
}

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429).
  	    color_prompt=yes
    else
	    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="$COLOR_USERNAME$TEXT_USERNAME$RESET$TEXT_AT$COLOR_HOSTNAME$TEXT_HOSTNAME$RESET$TEXT_IN$COLOR_WORKING_DIRECTORY$TEXT_WORKING_DIRECTORY$RESET\$(__git_prompt)$RESET\n$ "
else
    PS1="$TEXT_USERNAME$TEXT_AT$TEXT_HOSTNAME$TEXT_IN$TEXT_WORKING_DIRECTORY\$(__git_prompt)\n$ "
fi
unset color_prompt force_color_prompt

PS2="#═> "
