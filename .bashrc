[[ -s "/Users/andy/.rvm/scripts/rvm" ]] && source "/Users/andy/.rvm/scripts/rvm"

export http_proxy=`proxy-config -h`
export https_proxy=`proxy-config -s`
export ftp_proxy=`proxy-config -f`

export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export EDITOR='mate'

source ~/.aliases
source ~/.private_aliases
source ~/.bbc

export RA_MANUAL=1
#export HTTPS=1
export DISABLE_PROXY=1
export VERBOSE=1

# no need for 'require "rubygems"' in your code
export RUBYOPT=rubygems
export LAUNCHY=1

# from http://jonmaddox.com/2008/03/13/show-your-git-branch-name-in-your-prompt/

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[$RED\u@\h:\w$GREEN\$(parse_git_branch)$BLUE]\
$GREEN\$ "
PS2='> '
PS4='+ '
}
proml