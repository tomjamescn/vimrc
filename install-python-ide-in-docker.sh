mkdir /etc/apt/sources.list.d/

apt-get install -y curl git zsh build-essential software-properties-common



sh -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/tools/install.sh)"


curl -sL install-node.now.sh/lts | bash -s -- --yes

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt update
apt install -y yarn


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

