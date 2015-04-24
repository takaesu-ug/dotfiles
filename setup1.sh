#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python
brew install ansible

# ansibleのデフォルトのディレクトリを作りデフォルトのhostを設定する
# localhostでansibleを使うため
# デフォルトのインベントリファイルは /usr/local/etc/ansible/hosts だがデフォルトを書き換えたくないので、ansible_hosts を実行時と同じ設定する
# current_dir="`cd ${0%/*} && pwd`"
current_dir=$(cd $(dirname $0); pwd)
echo localhost > $current_dir/ansible_hosts
