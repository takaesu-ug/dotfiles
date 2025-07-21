# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

このリポジトリは、Neovim用の設定ファイルとプラグインを管理するdotfilesディレクトリです。Lua言語による現代的な設定と、lazy.nvimによる高性能なプラグイン管理を採用しています。

## アーキテクチャ

### Lua設定（推奨）
```
vimdir/
├── init.lua                 # メインエントリーポイント
├── lua/
│   ├── core/               # 基本設定
│   │   ├── init.lua        # コアモジュールのエントリー
│   │   ├── options.lua     # 基本オプション設定
│   │   ├── keymaps.lua     # キーマッピング
│   │   └── autocommands.lua # 自動コマンド
│   ├── ui/                 # UI関連
│   │   ├── init.lua        # UIモジュールのエントリー
│   │   ├── appearance.lua  # 表示設定
│   │   └── colors.lua      # カラースキーム
│   └── plugins/            # プラグイン設定
│       ├── init.lua        # lazy.nvim設定
│       └── configs/        # 各プラグインの設定
│           ├── coc.lua
│           ├── fzf.lua
│           ├── lightline.lua
│           └── ...
```

### 旧Vim設定（レガシー）
- `init.vim` - 旧Neovimエントリーポイント
- `vimrc.*` - 機能別に分割された設定ファイル群
- `plugged/` - インストールされたプラグイン（vim-plug管理）

### 共通ディレクトリ
- `autoload/` - 自動読み込みスクリプト
- `ftplugin/` - ファイルタイプ別プラグイン
- `dict/` - 辞書ファイル（各言語用）
- `snippets/` - スニペット定義
- `sessions/` - セッション管理

### 主要なプラグイン
- `coc.nvim` - LSPクライアント（Language Server Protocol）
- `ale` - 非同期リンター
- `fzf.vim` - ファジーファインダー
- `vim-fugitive` - Git統合
- `lightline.vim` - ステータスライン

## 開発コマンド

### プラグインのインストール/更新（lazy.nvim）
```vim
:Lazy           " Lazy UIを開く
:Lazy install   " プラグインのインストール
:Lazy update    " プラグインの更新
:Lazy clean     " 不要なプラグインの削除
:Lazy sync      " インストール+更新+削除を一括実行
```

### プラグインのインストール/更新（vim-plug - レガシー）
```vim
:PlugInstall    " プラグインのインストール
:PlugUpdate     " プラグインの更新
:PlugClean      " 不要なプラグインの削除
```

### COC（Language Server）関連
```vim
:CocInstall <extension>    " COC拡張のインストール
:CocList extensions        " インストール済み拡張の一覧
:CocConfig                 " COC設定ファイルを開く
```

### ファイルの検索
```vim
:Files          " FZFでファイル検索
:Rg <pattern>   " ripgrepで内容検索
:Buffers        " バッファ一覧
```

## 設定の変更方法

### Lua設定の場合（推奨）
1. `lua/core/`以下のファイルで基本設定を編集
2. `lua/ui/`以下のファイルで表示設定を編集
3. `lua/plugins/init.lua`でプラグインの追加・削除
4. `lua/plugins/configs/`以下でプラグイン個別設定を編集
5. 設定変更後は`:luafile %`で再読み込み、または再起動

### Vim設定の場合（レガシー）
1. 機能別に分かれた`vimrc.*`ファイルを編集
2. プラグインの追加は`vimrc.plug`で管理
3. 設定変更後は`:source %`で再読み込み、または再起動

## init.vimからinit.luaへの移行

### 移行手順
1. `init.lua`とLua設定ファイルを確認
2. 旧設定ファイル（`init.vim`など）をバックアップ
3. Neovimを再起動してLua設定を読み込み
4. プラグインが正常に動作することを確認
5. 必要に応じて個別設定を調整

### 移行後のメリット
- 高速な起動時間（lazy.nvimによる遅延読み込み）
- Luaの豊富な機能と型安全性
- モダンなNeovim APIの活用
- より構造化された設定管理
- パフォーマンスの向上

## 注意事項

- このディレクトリは`~/dotfiles/vimdir`として配置されることを前提としている
- Lua設定とVim設定は共存可能だが、init.luaが優先される
- プラグインは`~/.local/share/nvim/lazy/`（lazy.nvim）または`~/.vim/plugged`（vim-plug）にインストールされる
- lazy.nvimは初回起動時に自動インストールされる
