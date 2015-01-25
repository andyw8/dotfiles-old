set nocompatible              " Required by Vundle
filetype off                  " Required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins on GitHub (alphabetical)
Plugin 'ervandew/supertab'
Plugin 'gabebw/vim-spec-runner'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'             " For the_silver_searcher (grep replacement)
Plugin 'scrooloose/syntastic'
Plugin 'skwp/greplace.vim'        " Global search and replace
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'       " asynchronous build and test dispatcher
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'       " Defaults everyone can agree on
Plugin 'tpope/vim-surround'       " Quoting/parenthesizing made simple
Plugin 'vim-ruby/vim-ruby'
Plugin 'wincent/Command-T'        " Fast opening of files

" All plugins must be added before the following line
call vundle#end()            " required by vundle
filetype plugin indent on    " required by vundle

let mapleader = "\<Space>"

set tabstop=2
set shiftwidth=2
set expandtab

" Use Silver Searcher instead of grep
set grepprg=ag

" Better navigation within wrapped lines
" nmap k gk
" nmap j gj

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or

map <C-t> <esc>:tabnew<CR>
nnoremap <C-n> :call NumberToggle()<cr>

map <Leader>bi :!bundle install<cr>
map <Leader>l <Plug>RunMostRecentSpec  " vim-spec-runner
map <Leader>o :CommandT<cr>
map <Leader>s <Plug>RunFocusedSpec     " vim-spec-runner
map <Leader>so :source ~/.vimrc<cr>
map <Leader>t <Plug>RunCurrentSpecFile " vim-spec-runner
nmap <Leader>vi :source ~/.vimrc<cr>:PluginInstall<cr>
let g:spec_runner_dispatcher = 'Dispatch {command}'

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" tag complete only from current buffer and ctags
:set complete=.,t
