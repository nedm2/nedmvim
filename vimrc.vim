"General vimrc
"Inlude with: source <vimrc>

"basic editing stuff
set expandtab
set autoindent
set tabstop=4

"syntax
syntax enable
au BufRead,BufNewFile *.fs set filetype=fs       "f sharp syntax
au BufNewFile,BufRead *.cpy set filetype=python "python c-generators

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

"jk esc and friends
imap jk <Esc>
nnoremap ; :

"Smoother scrolling
:nmap <C-d> 
:nmap <C-u> 

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
noremap <C-N> :tabnew 

" get rid of a few keystrokes for common command line tasks
nnoremap ;; :!
nnoremap ;' :<C-F>
