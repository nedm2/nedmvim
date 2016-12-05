"General vimrc
"Inlude with: source <vimrc>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'EasyMotion'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'moll/vim-bbye'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" airline config
let g:airline#extensions#tabline#enabled = 1

"basic editing stuff
set expandtab
set autoindent
set tabstop=4

"syntax
syntax enable
au BufRead,BufNewFile *.fs set filetype=fs       "f sharp syntax
au BufNewFile,BufRead *.cpy set filetype=python "python c-generators

"wild menu settings
set wildmode=longest,list,full
set wildmenu

"normal backspace operation
set backspace=2

"custom status bar
:set laststatus=2
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

"jk esc and friends
imap jk <Esc>
nnoremap ; :

"Smoother scrolling
set scroll=10

" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" toggle paste mode with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" easy open new tab
map <silent> <C-n> :NERDTreeFocus<CR>

" get rid of a few keystrokes for common command line tasks
nnoremap ;; :!
nnoremap ;' :<C-F>

" Search and replace under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Window navigation
nmap <silent> <C-a> <C-W>w

nmap <silent> <Tab> :bn<CR>
nmap <silent> <S-Tab> :bp<CR>

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

highlight Search ctermfg=black

set hidden

command Q Bdelete
