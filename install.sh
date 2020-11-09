git submodule update --init

BASEDIR=$(pwd)
ln -svf $BASEDIR/.vimrc ~ 
ln -svf $BASEDIR/.zshrc ~ 
ln -svf $BASEDIR/.tmux.conf ~ 

mkdir ~/.config/lf
ln -svf $BASEDIR/lf/lfrc ~/.config/lf/

#Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Install OhMyZsh
export ZSH="$HOME/.dotfiles/zsh/ohmyzsh"
source "$HOME/.zshrc"

