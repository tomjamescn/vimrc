#!/bin/bash
# 网络环境会导致直接安装失败，使用此脚本可以避免这个问题

if [ -z $GOPATH ];then
    echo "GOPATH not exists!"
    exit 1
fi

dir=$GOPATH/src/golang.org/x

mkdir -p $dir

cd $dir

go_x_packages=("tools" \
    "lint" \
    "crypto" \
    "debug" \
    "image" \
    "net" \
    "sys" \
    "text" \
    "time" \
    "sync"
)

for i in ${go_x_packages[@]};
do
    echo $i
    if [ -d "$i" ]; then
        #已经存在了，更新
        cd $i
        #git pull
        cd ../
    else
        #
        git clone https://github.com/golang/${i}.git
    fi
done

dir=$GOPATH/src/github.com

cd $dir

go_installs=("github.com/klauspost/asmfmt/cmd/asmfmt" \
	"github.com/go-delve/delve/cmd/dlv" \
	"github.com/kisielk/errcheck" \
	"github.com/davidrjenni/reftools/cmd/fillstruct" \
	"github.com/mdempsky/gocode" \
	"github.com/stamblerre/gocode" \
	"github.com/stamblerre/gocode" \
	"github.com/rogpeppe/godef" \
	"github.com/zmb3/gogetdoc" \
	"github.com/alecthomas/gometalinter" \
	"github.com/golangci/golangci-lint/cmd/golangci-lint" \
	"github.com/fatih/gomodifytags" \
	"github.com/jstemmer/gotags" \
	"github.com/josharian/impl" \
	"honnef.co/go/tools/cmd/keyify" \
	"github.com/fatih/motion" \
	"github.com/koron/iferr" \
)

for i in ${go_installs[@]};
do
    echo $i
    IFS='/' read -r -a arr <<< "$i"
    domain_name=${arr[0]}
    user_name=${arr[1]}
    project_name=${arr[2]}
    if [ "$domain_name" != "github.com" ]; then
        echo "忽略非github.com包"
    else
        package="${user_name}/${project_name}"
        if [ -d "$package" ]; then
            #更新
            cd $package
            git pull
            cd ../../
        else
            git_url="https://github.com/${package}.git"
            git clone $git_url $package
        fi
    fi
done

vim main.go -c GoInstallBinaries +qall
