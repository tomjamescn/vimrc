#!/bin/bash

if [ -z $GOPATH ];then
    echo "GOPATH not exists!"
    exit 1
fi

dir=$GOPATH/src/golang.org/x

mkdir -p $dir 

cd $dir

git clone https://github.com/golang/tools.git
git clone https://github.com/golang/lint.git

vim -c GoInstallBinaries +qall

