" ~/.vimrc : vim configuration
" NOTE: i don't use vim anymore, this is here for archive purposes

" viM
set nocompatible

" enable mouse/scroll
set mouse=a

" persistent undo
set undodir=/home/zzz/.vim/undodir
set undofile

" auto backups : on every write this saves the buffer in ~/.vim/backups with a
" timestamp appended to the filename
set backup
set backupdir=~/.vim/backups/
set writebackup
au BufWritePre * let &bex = '@' . strftime("%F.%R")
au BufWritePost *.tex silent !make

" fix tmux colorschemes
set background=dark

" highlight rules
highlight StatusLine cterm=NONE ctermbg=8 ctermfg=15
highlight StatusLineNC cterm=NONE ctermbg=8 ctermfg=7
highlight SpecialKey term=NONE cterm=NONE ctermbg=none ctermfg=0
highlight NonText term=NONE cterm=NONE ctermbg=none ctermfg=0

" setting needed for vim-go
set autowrite

" better split
set splitbelow
set splitright

" list whitespace
set listchars=eol:¶,tab:–·
set list

" 
set hidden
set noshowmode
set modelines=0

" fix backspace
set backspace=indent,eol,start

" indent
"set autoindent

" ruler
set ruler

" colors
filetype plugin on
syntax on

" mappings
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>
map <C-g> :GoDef<CR>
map <C-b> :GoBuild<CR>

" disable arrows :^)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" tabs depending on file
au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
"au Filetype c call SetCOptions()

" status
set laststatus=2

set statusline=%t        " tail of the filename
set statusline+=\ %h     " help file flag
set statusline+=%m       " modified flag
set statusline+=%r       " read only flag
set statusline+=%y       " filetype
set statusline+=%=       " left/right separator
set statusline+=%{&ff}\  " file format
set statusline+=%c,%l    " col/line

" pathogen sh!t
let pathogen_disabled = ['syntastic']
call pathogen#infect()
