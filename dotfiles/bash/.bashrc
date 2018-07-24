source ~/.git-completion.bash
source ~/.custom_commands.sh

export set PATH=$PATH:$HOME/bin

# Add GNU coreutils to the `$PATH`
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Use python3
export PATH=/Users/ad/bin:/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:$PATH

##------------------------------------------------------------------------------------
## Personal Aliases
##------------------------------------------------------------------------------------

# lists
alias ll="ls -al --color=auto --group-directories-first"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Bash
alias h="history"

# Python
alias simpleserve='python -m SimpleHTTPServer'

# Typos
alias got="git"



##------------------------------------------------------------------------------------
## Functions
##------------------------------------------------------------------------------------

# Open directory in VScode
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

##------------------------------------------------------------------------------------
## PS1
##------------------------------------------------------------------------------------

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

HOST=' \[$(tput sgr0)\]\[\033[38;5;15m\] \h\'
TIME='\[\033[38;5;246m\]\t\'
LOCATION='\w\'
BRANCH='$(parse_git_branch)'
INPUT='\n\$ \[$(tput sgr0)\]'
export PS1="\[\033[38;5;246m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] \h\w\[\033[38;5;87m\]\$(parse_git_branch)\n\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

##------------------------------------------------------------------------------------
## Colors
##------------------------------------------------------------------------------------

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


ALERT=${BWhite}${On_Red} # Bold White on red background