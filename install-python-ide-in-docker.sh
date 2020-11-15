mkdir /etc/apt/sources.list.d/

apt-get install -y curl git zsh build-essential software-properties-common



sh -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/tools/install.sh)"


curl -sL install-node.now.sh/lts | bash -s -- --yes

git clone https://github.com/tomjamescn/vimrc.git $HOME/.vim 

cat << EOF >> $HOME/.zshrc

export MYVIMRC='~/.vim/vimrc'
export VIMINIT='source $MYVIMRC'

EOF
```



cd $HOME/.vim \
    && git pull \
    && git checkout only-python \
    && sh $PWD/install.sh

echo "You may be run:\n\nvim -c 'CocInstall -sync coc-json coc-snippets coc-git coc-python|q'\n\n"

vim -c 'CocInstall -sync coc-json coc-snippets coc-git coc-python|q'
