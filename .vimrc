"General vimrc
"Inlude with: source <vimrc>

"basic editing stuff
set expandtab
set autoindent
set tabstop=4

"syntax
syntax enable
au BufRead,BufNewFile *.fs set filetype=fs  "f sharp syntax

"Use vim improvements
set nocompatible

"wild menu settings
set wildmode=longest,list,full
set wildmenu

"normal backspace operation
set backspace=2

"custom status bar
":set laststatus=2
":set statusline=%F%m%r%h%w\ %{&ff}\ %Y\ [0x\%02.2B]\ %=%l/%L,%v\ %p%%
set ruler
set rulerformat=%100(%t%m%r%h%w\ %Y\ %=0x\%02.2B\ %l/%L,%v\ %p%%%)

"highlight search matches
set hlsearch

"Allow opening of many tabs
set tabpagemax=100

"turn off automatic wrapping
set textwidth=0
set wrapmargin=0

"turn off line wrap
set nowrap

"jk esc
imap jk <Esc>
