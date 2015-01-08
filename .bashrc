# ~/.bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then # installed by homebrew
    . `brew --prefix`/etc/bash_completion
fi

export TERM=xterm-256color    # Make the terminal use 256 colors instead of the default 8
export EDITOR=vim
export CLICOLOR=1

[ "${BASH_VERSINFO[0]}" -ge 4 ] && shopt -s autocd # cd by naming directory (in bash 4)
shopt -s histappend           # append to the history file, don't overwrite it
shopt -s checkwinsize         # update the value of LINES and COLUMNS after each command
shopt -s expand_aliases       # expand aliases
shopt -s hostcomplete         # attempt hostname expansion when @ is at the beginning of a word
shopt -s dotglob              # include dotfiles in pathname expansion

# History
HISTCONTROL=ignorespace       # don't put empty lines in the history.
HISTSIZE=10000
HISTFILESIZE=2000
PROMPT_COMMAND='history -a'   # share history across all terminals

# regular colors
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"

# emphasized (bolded) colors
BBLACK="\033[1;30m"
BRED="\033[1;31m"
BGREEN="\033[1;32m"
BYELLOW="\033[1;33m"
BBLUE="\033[1;34m"
BMAGENTA="\033[1;35m"
BCYAN="\033[1;36m"
BWHITE="\033[1;37m"

# reset
RESET="\033[0;0m"
  
TEXT_USERNAME='\u'
TEXT_AT=' at '
TEXT_HOSTNAME='\h'
TEXT_IN=' in '
TEXT_WORKING_DIRECTORY='\w'

if [ "$UID" == 0 ] || [ $TEXT_USERNAME == "root" ] ; then
    COLOR_USERNAME="\[$BRED\]"
else
    COLOR_USERNAME="\[$YELLOW\]"
fi

if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
    COLOR_HOSTNAME="\[$BCYAN\]"
else
    COLOR_HOSTNAME="\[$BGREEN\]"
fi

COLOR_WORKING_DIRECTORY="\[$BYELLOW\]"
COLOR_ESCAPED_RESET="\[$RESET\]"

function __git_prompt {
	GIT_CHANGES_COLOUR=$RED
	GIT_NOCHANGES_COLOUR=$GREEN

	GIT_PS1_SHOWDIRTYSTATE=1
	
	# The general gist of the following sed command is as follows:
	# 1. Exploit the fact that git branches can't have spaces. So search for a string which does not have a space.
	# 1.1. If this matches, set colour to NOCHANGES, insert capture and skip to end of commands.
	# 2. Failing previous test, assume that the repo has changes because a space has been found, which indicates a following change state marker.
	# 2.2. Remove change markers as we're using colourisation to show the change state.
	# 3. Insert the full output and prefix the CHANGES colour.
	__git_ps1 "%s" | sed -e "s/^\([^ ]\{1,\}\)$/ on $(printf $GIT_NOCHANGES_COLOUR)\1/;t" -e "s/ [*+#]\{1,\}//" -e "s/^/ on $(printf $GIT_CHANGES_COLOUR)/"
}

PS1="$COLOR_USERNAME$TEXT_USERNAME$COLOR_ESCAPED_RESET$TEXT_AT$COLOR_HOSTNAME$TEXT_HOSTNAME$COLOR_ESCAPED_RESET\
$TEXT_IN$COLOR_WORKING_DIRECTORY$TEXT_WORKING_DIRECTORY$COLOR_ESCAPED_RESET\$(__git_prompt)$COLOR_ESCAPED_RESET\n$ "
PS2="#═> "
