" sensible defaults from http://mislav.uniqpath.com/2011/12/vim-revisited/

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" for plain text editing
set wrap
set linebreak

" disable arrow keys in normal and insert modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" change the mapleader from \ to ,
let mapleader=","

" use pathogen for plugin management
execute pathogen#infect()

" enable line numbers
:set number

" easier split navigation with <C-H> <C-J> <C-K> <C-L>
" http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set the tag file search order
set tags=./tags;

" use ack instead of grep
set grepprg=ack

" easy bindings for navigating next/previous grep/ack results
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" map Control-S to Save (from r00k)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-h> :nohl<cr>

" reload config
map <Leader>so :so %<cr>
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

map ,p orequire 'pry'; binding.pry<ESC>

" http://danielmiessler.com/ use jk to exit insert mode, instead of ESC
inoremap jk <ESC>

" https://github.com/r00k/dotfiles/blob/master/vimrc
" http://stackoverflow.com/a/15317146/119822
set directory=/tmp//" Don't clutter my dirs up with swp and tmp files

" strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
