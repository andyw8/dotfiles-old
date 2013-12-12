[[ -s "/Users/andy/.rvm/scripts/rvm" ]] && source "/Users/andy/.rvm/scripts/rvm"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export http_proxy=`proxy-config -h`
export https_proxy=`proxy-config -s`
export ftp_proxy=`proxy-config -f`

export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export EDITOR='subl -w'

source ~/.aliases
source ~/.private_aliases

export RA_MANUAL=1
#export HTTPS=1
export DISABLE_PROXY=1
export VERBOSE=1

# no need for 'require "rubygems"' in your code
export RUBYOPT=rubygems
export LAUNCHY=1

# from https://github.com/garybernhardt/dotfiles/blob/master/.bashrc

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\h:\W\$(parse_git_branch) \u\$ "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin # Add RVM to PATH for scripting

# git aliases from http://gitimmersion.com/lab_11.html
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gx='gitx --all'
