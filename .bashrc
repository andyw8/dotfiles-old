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
