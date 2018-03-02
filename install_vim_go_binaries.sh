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

go_installs=("golang.org/x/lint/golint" \
    "golang.org/x/tools/cmd/goimports" \
    "golang.org/x/tools/cmd/gorename" \
    "golang.org/x/tools/cmd/guru" \
    "github.com/klauspost/asmfmt/cmd/asmfmt" \
    "github.com/derekparker/delve/cmd/dlv" \
    "github.com/kisielk/errcheck" \
    "github.com/davidrjenni/reftools/cmd/fillstruct" \
    "github.com/nsf/gocode" \
    "github.com/rogpeppe/godef" \
    "github.com/zmb3/gogetdoc" \
    "github.com/alecthomas/gometalinter" \
    "github.com/fatih/gomodifytags" \
    "github.com/jstemmer/gotags" \
    "github.com/josharian/impl" \
    "github.com/dominikh/go-tools/cmd/keyify" \
    "github.com/fatih/motion" \
)

for i in ${go_installs[@]};
do
    echo $i
    echo "start..."
    IFS='/' read -r -a arr <<< "$i"
    domain_name=${arr[0]}
    user_name=${arr[1]}
    project_name=${arr[2]}
    if [ "$domain_name" == "github.com" ]; then
        dir="${GOPATH}/src/github.com"
        mkdir -p $dir
        cd $dir
        git_url="https://github.com/${user_name}/${project_name}.git"
        git clone $git_url
    fi
    go get -u -v $i
    echo "end"
    echo ""
done

