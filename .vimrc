source $HOME/nedmvim/vimrc.vim
if filereadable(expand("$HOME/.vimrclocal"))
    source $HOME/.vimrclocal
endif

exe 'set rtp+=' . expand('~/nedmvim')
