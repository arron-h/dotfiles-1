# ~/.bashrc: executed by bash(1) for non-login shells.

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Make the terminal use 256 colors instead of the default 8
export TERM=xterm-256color

export EDITOR=vim

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
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

  # regular colors
  K="\[\033[0;30m\]"    # black
  R="\[\033[0;31m\]"    # red
  G="\[\033[0;32m\]"    # green
  Y="\[\033[0;33m\]"    # yellow
  B="\[\033[0;34m\]"    # blue
  M="\[\033[0;35m\]"    # magenta
  C="\[\033[0;36m\]"    # cyan
  W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  BK="\[\033[1;30m\]"
  BR="\[\033[1;31m\]"
  BG="\[\033[1;32m\]"
  BY="\[\033[1;33m\]"
  BB="\[\033[1;34m\]"
  BM="\[\033[1;35m\]"
  BC="\[\033[1;36m\]"
  BW="\[\033[1;37m\]"

  # reset
  RESET="\[\033[0;37m\]"
  NC='\e[0m'                  # No Color
  
TEXT_USERNAME='\u'
TEXT_AT=' at '
TEXT_HOSTNAME='\h'
TEXT_IN=' in '
TEXT_WORKING_DIRECTORY='\w'

# Git completion and branch info
. ~/.dotfiles/bash/lib/git-completion.bash

function __git_prompt {
  GIT_PS1_SHOWDIRTYSTATE=1
  __git_ps1 " on %s" | sed 's/ \([+*]\{1,\}\)$/\1/'
}

# Only show username@server over SSH.
function __name_and_server {
  if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
    echo "`hostname -s`"
    COLOR_HOSTNAME=$BC
  else
    echo "`hostname -s`"
    COLOR_HOSTNAME=$BG
  fi
}

  if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
    COLOR_HOSTNAME=$BC
  else
    COLOR_HOSTNAME=$BG
  fi

if [ "$UID" == 0 ] || [ $TEXT_USERNAME == "root" ] ; then
    COLOR_USERNAME=$BR
else
    COLOR_USERNAME=$Y
fi

COLOR_WORKING_DIRECTORY=$BY

PATH=$PATH:$HOME/scripts

PS1="\t $COLOR_USERNAME$TEXT_USERNAME$RESET at $COLOR_HOSTNAME\$(__name_and_server)$RESET in $COLOR_WORKING_DIRECTORY\w$RESET\$(__git_prompt)$RESET\n$ "

PS2="#═> "

# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

#function parse_git_dirty {
#  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && #echo "*"
#}
#function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
#}
#export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

#PS1='\u at \h in \w$(__git_prompt) \n$ '
#PS1="${COLOR_USERNAME}${TEXT_USERNAME}\
#${NC}${TEXT_AT}\
#${COLOR_HOSTNAME}${TEXT_HOSTNAME}\
#${NC}${TEXT_IN}\
#${COLOR_WORKING_DIRECTORY}${TEXT_WORKING_DIRECTORY}\
#$(__git_prompt)\
#${NC}\n$ "
