mkdir /etc/apt/sources.list.d/

apt-get install -y curl git zsh build-essential software-properties-common



sh -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/tools/install.sh)"


curl -sL install-node.now.sh/lts | bash -s -- --yes

git clone https://github.com/tomjamescn/vimrc.git $HOME/.vim 

cd $HOME/.vim \
    && git pull \
    && git checkout only-python \
    && sh $PWD/install.sh

vim -c 'CocInstall -sync coc-json coc-snippets coc-git coc-python|q'

cat << EOF >> $HOME/.zshrc

export MYVIMRC='~/.vim/vimrc'
export VIMINIT='source $MYVIMRC'

EOF
```

zsh

