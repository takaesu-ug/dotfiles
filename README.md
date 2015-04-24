yusabana's dotfiles
========

dot files(Setting files) Repository （設定ファイル関連のリポジトリ）


ansible実行

setup1.shを実行してから
[Mac の開発環境構築を自動化する (2015 年初旬編) - t-wadaのブログ](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
[AnsibleでHomebrew, Cask, Atomエディターのパッケージを管理する - Qiita](http://qiita.com/hnakamur/items/1c27cf0df19fe57ec624)

```
ansible-playbook -i ansible_hosts -vv homebrew-packages.yml
```
