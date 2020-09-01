BASEDIR=$(pwd)
ln -svf $BASEDIR/.vimrc ~ 
ln -svf $BASEDIR/.zshrc ~ 
ln -svf $BASEDIR/.tmux.conf ~ 

#Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
