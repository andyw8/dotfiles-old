# rmtrash can be installed using Homebrew
alias rm="echo 'Use rmtrash, or full path name for rm'"
alias rmdir="echo 'Use rmtrash, or full path name for rmdir'"

export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export EDITOR='vim'

source ~/.aliases
source ~/.project_aliases
source ~/.private_aliases

# no need for 'require "rubygems"' in your code
export RUBYOPT=rubygems

# from https://github.com/garybernhardt/dotfiles/blob/master/.bashrc
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\h:\W\$(parse_git_branch) \u\$ "

PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/dotfiles/bin

# trying to fix postgres
# http://tammersaleh.com/posts/installing-postgresql-for-rails-3-1-on-lion
PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(rbenv init -)"

# http://lifehacker.com/278888/ctrl%252Br-to-search-and-other-terminal-history-tricks
HISTFILESIZE=1000000000
HISTSIZE=1000000

#export PATH="./bin:$PATH"
set -o noclobber

# https://github.com/zimbatm/direnv
eval "$(direnv hook bash)"

# enable bash mode for vi
set -o vi

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
# Add the following to your ~/.bashrc or ~/.zshrc
#
# Alternatively, copy/symlink this file and source in your shell.  See `hitch --setup-path`.

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# Uncomment to persist pair info between terminal instances
# hitch
export PATH="$HOME/Library/Haskell/bin:$PATH"
