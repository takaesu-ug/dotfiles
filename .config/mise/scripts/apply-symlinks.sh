#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${HOME}/dotfiles"

declare -A LINKS=(
  ["${HOME}/.zshrc"]="${DOTFILES_DIR}/.zshrc"
  ["${HOME}/.zlogin"]="${DOTFILES_DIR}/.zlogin"
  ["${HOME}/.zshenv"]="${DOTFILES_DIR}/.zshenv"
  ["${HOME}/.gitconfig"]="${DOTFILES_DIR}/git/.gitconfig"
  ["${HOME}/.gitconfig.local"]="${DOTFILES_DIR}/git/.gitconfig.local"
  ["${HOME}/.gitignore_global"]="${DOTFILES_DIR}/git/.gitignore_global"
#  ["${HOME}/.inputrc"]="${DOTFILES_DIR}/.inputrc"
#  ["${HOME}/.tigrc"]="${DOTFILES_DIR}/.tigrc"
#  ["${HOME}/.tmux.conf"]="${DOTFILES_DIR}/.tmux.conf"
#  ["${HOME}/.vimrc"]="${DOTFILES_DIR}/.vimrc"
#  ["${HOME}/.vim"]="${DOTFILES_DIR}/vimdir"
#  ["${HOME}/.config/nvim"]="${DOTFILES_DIR}/vimdir"
#  ["${HOME}/.bundle"]="${DOTFILES_DIR}/.bundle"
#  ["${HOME}/.config/karabiner"]="${DOTFILES_DIR}/.config/karabiner"
#  ["${HOME}/.config/wezterm"]="${DOTFILES_DIR}/.config/wezterm"
#  ["${HOME}/.config/ghostty"]="${DOTFILES_DIR}/.config/ghostty"
#  ["${HOME}/.peco"]="${DOTFILES_DIR}/.peco"
#  ["${HOME}/.docker/config.json"]="${DOTFILES_DIR}/.docker/config.json"
#  ["${HOME}/bin"]="${DOTFILES_DIR}/bin"
#  ["${HOME}/.config/hub"]="${HOME}/Dropbox/_config/hub"
#  ["${HOME}/.config/whichpr"]="${HOME}/Dropbox/_config/whichpr"
#  ["${HOME}/.config/memo"]="${HOME}/Dropbox/_config/memo"
#  ["${HOME}/.config/pet"]="${HOME}/Dropbox/_config/pet"
#  ["${HOME}/_secret"]="${HOME}/Dropbox/_secret"
#  ["${HOME}/.ctags"]="${DOTFILES_DIR}/.ctags"
#  ["${HOME}/Library/Application Support/Code/User/settings.json"]="${DOTFILES_DIR}/vscode/settings.json"
#  ["${HOME}/Library/Application Support/Code/User/keybindings.json"]="${DOTFILES_DIR}/vscode/keybindings.json"
#  ["${HOME}/Library/Application Support/Code/User/snippets"]="${DOTFILES_DIR}/vscode/snippets"
#  ["${HOME}/.ideavimrc"]="${DOTFILES_DIR}/.ideavimrc"
)

ensure_link() {
  local dest="$1"
  local src="$2"

  mkdir -p "$(dirname "${dest}")"

  if [[ -L "${dest}" ]]; then
    local current
    current="$(readlink "${dest}")"
    if [[ "${current}" == "${src}" ]]; then
      echo "[skip] ${dest} -> ${src}"
      return
    fi
    echo "[warn] ${dest} は既存リンク (${current}) を指しています。更新します。"
    rm "${dest}"
  elif [[ -e "${dest}" ]]; then
    local backup="${dest}.$(date +%Y%m%d%H%M%S).bak"
    echo "[info] ${dest} が存在するため ${backup} へ退避します。"
    mv "${dest}" "${backup}"
  fi

  ln -s "${src}" "${dest}"
  echo "[link] ${dest} -> ${src}"
}

for dest in "${!LINKS[@]}"; do
  ensure_link "${dest}" "${LINKS[${dest}]}"
done
