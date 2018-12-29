#!/bin/bash
# 网络环境会导致直接安装失败，使用此脚本可以避免这个问题

if [ -z $GOPATH ];then
    echo "GOPATH not exists!"
    exit 1
fi

dir=$GOPATH/src/golang.org/x

mkdir -p $dir

cd $dir

git clone https://github.com/golang/tools.git
git clone https://github.com/golang/lint.git
git clone https://github.com/golang/crypto.git
git clone https://github.com/golang/debug.git
git clone https://github.com/golang/image.git
git clone https://github.com/golang/net.git
git clone https://github.com/golang/sys.git
git clone https://github.com/golang/text.git
git clone https://github.com/golang/time.git
git clone https://github.com/golang/sync.git

go_installs=("golang.org/x/lint/golint" \
    "golang.org/x/tools/cmd/goimports" \
    "golang.org/x/tools/cmd/gorename" \
    "golang.org/x/tools/cmd/guru" \
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
    go get -v $i
    echo "end"
    echo ""
done

