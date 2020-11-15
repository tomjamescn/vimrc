mkdir /etc/apt/sources.list.d/

apt-get install -y curl git zsh build-essential software-properties-common

sh -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/tools/install.sh)"

curl -sL install-node.now.sh/lts | bash -s -- --yes

add-apt-repository ppa:jonathonf/vim -y
apt update
apt install -y vim vim-nox

export MYVIMRC='~/.vim/vimrc'
export VIMINIT='source $MYVIMRC'

git clone https://github.com/tomjamescn/vimrc.git $HOME/.vim 

cat << EOF >> $HOME/.zshrc

export MYVIMRC='~/.vim/vimrc'
export VIMINIT='source $MYVIMRC'

EOF


cd $HOME/.vim \
    && git pull \
    && git checkout only-python

