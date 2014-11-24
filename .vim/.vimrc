" sensible defaults from http://mislav.uniqpath.com/2011/12/vim-revisited/

set nocompatible                " choose no compatibility with legacy vi

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)

"" Searching
set hlsearch                    " highlight matches
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

" change the mapleader from \ to Space
let mapleader="\<Space>"

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

" use ag instead of grep
set grepprg=ag

" easy bindings for navigating next/previous grep/ack results
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" vim-rspec mappings
nnoremap <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :w<cr>:call RunNearestSpec()<CR>
nnoremap <Leader>l :w<cr>:call RunLastSpec()<CR>

" https://gist.github.com/Integralist/8115457
" I had to prefix the cucumber executable with bin/, unsure why it doesn't
" pick up the path
" Run currently open cucumber feature file
map <Leader>ct :w<cr>:!bin/cucumber -r features %<cr>
" Run current cucumber scenario
map <Leader>cs :w<cr>:exe "!bin/cucumber -r features % -l" . line(".")<cr>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-h> :nohl<cr>
map <C-q> <esc>:q<CR>
imap <C-q> <esc>:q<CR>

" reload config
map <Leader>so :so %<cr>

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" trigger pry before current line
map <Leader>p Orequire 'pry'; binding.pry<ESC>

" http://danielmiessler.com/ use jk to exit insert mode, instead of ESC
inoremap jk <ESC>

" https://github.com/r00k/dotfiles/blob/master/vimrc
" http://stackoverflow.com/a/15317146/119822
set directory=/tmp//" Don't clutter my dirs up with swp and tmp files

" strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

map <Leader>T <esc>:CommandT<CR>
map <C-t> <esc>:CommandT<CR>

" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
    else
      return "\<c-p>"
    endif
  endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

map <C-t> <esc>:tabnew<CR>

" Improve up/down movement on wrapped lines https://github.com/artemave/myrcs
nnoremap j gj
nnoremap k gk

" https://github.com/thoughtbot/vim-rspec#iterm-instead-of-terminal
" (doesn't work?)
let g:rspec_runner = "os_x_iterm"

" toggle colored right border after 80 chars
highlight ColorColumn ctermbg=8 " Dark Gray
set colorcolumn=81
let s:color_column_old = 0

function! s:ToggleColorColumn()
  if s:color_column_old == 0
    let s:color_column_old = &colorcolumn
    windo let &colorcolumn = 0
  else
    windo let &colorcolumn=s:color_column_old
    let s:color_column_old = 0
  endif
endfunction

nnoremap <Leader>8 :call <SID>ToggleColorColumn()<cr>

" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1

" dot formula with range (from Drew Neil's core-vim-course)
:xnoremap . :norm.<CR>

" http://robots.thoughtbot.com/use-rspec-vim-with-tmux-and-dispatch
let g:rspec_command = "Dispatch rspec {spec}"
