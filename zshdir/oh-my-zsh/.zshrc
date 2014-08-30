# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="ys"
# ZSH_THEME="dpoggi"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# this theme depends on git plugin.


## カスタムプロンプト
# 参考
# oh-my-zshのテーマに関するTips http://qiita.com/takc923/items/c479e38112b913b7614a
function str_with_color() {
  echo "%{$fg[$1]%}$2%{$reset_color%}"
}
function my_git_status() {
  # testコマンド で current_branchを取得して git _prompt_statusを表示する
  [ $(current_branch) ] && echo "($(current_branch) $(git_prompt_status))"
}

ZSH_THEME_GIT_PROMPT_ADDED=$(str_with_color cyan '+')
ZSH_THEME_GIT_PROMPT_MODIFIED=$(str_with_color yellow '*')
ZSH_THEME_GIT_PROMPT_DELETED=$(str_with_color red 'x')
ZSH_THEME_GIT_PROMPT_RENAMED=$(str_with_color blue 'o')
ZSH_THEME_GIT_PROMPT_UNMERGED=$(str_with_color magenta '!')
ZSH_THEME_GIT_PROMPT_UNTRACKED=$(str_with_color green '?')

# 絵文字
# http://punchdrunker.github.io/iOSEmoji/table_html/ios6/index.html
SUSHI=$'\U1F363 '
DEFAULT=$'\U1F37A ' # ビール
ERROR=$'\U1F479 '   # なまはげ

DATE_TIME=$(str_with_color white '%D{%Y-%m-%d %H:%M:%S}')
STATUS_CODE="(%(?.%F{green}.%F{red})%}%?%{%f%})"
STATUS_EMOJI="%(?.${DEFAULT}.${ERROR})"
PROMPT_PREFIX=$(str_with_color white '#')
USER_NAME=$(str_with_color blue '%n')
HOST_NAME=$(str_with_color cyan '%m')
CURRENT_DIRECTORY=$(str_with_color yellow '%~')
PROMPT_CHAR=$(str_with_color white ' %% ')
SEPARATOR1=$(str_with_color white '|')
SEPARATOR2=$(str_with_color white '@')
SEPARATOR3=$(str_with_color white ':')

PROMPT='${PROMPT_PREFIX}${STATUS_CODE}:${CURRENT_DIRECTORY} $(my_git_status) ${STATUS_EMOJI}
[${DATE_TIME}]$PROMPT_CHAR'

## 自分用の設定を読み込む
source ~/dotfiles/.zshrc

