cp .vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
