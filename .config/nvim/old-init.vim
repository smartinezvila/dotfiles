set mouse=a

"Tabbing
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

"Splits
set splitbelow splitright

"Highlighting
set cursorline
map <F4> :nohl<CR>

"Other
set number relativenumber
set background=dark
set nowrap
set laststatus=2
set clipboard=unnamedplus,unnamed
nnoremap <C-n> :NERDTreeToggle<CR>

"Colorscheme
set t_Co=256
colorscheme codedark

"Language Stuff
syntax on


"Statusline
"hi User1 ctermbg=white ctermfg=black
"hi User2 ctermbg=magenta ctermfg=black
"hi User3 ctermbg=lightgreen ctermfg=black
"hi User4 ctermbg=lightblue ctermfg=black
"hi User5 ctermbg=grey ctermfg=white
"hi User6 ctermbg=yellow ctermfg=black
"hi User7 ctermbg=blue ctermfg=black
"hi User8 ctermbg=red ctermfg=black
"set statusline=%3.l\ %2*\ %t\ %3*\ %F\ %6*%h%7*%m%8*%r%4*%y%5*%=%-14.(%l,%c%V%)\ %P
