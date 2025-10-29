#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${HOME}/dotfiles"

declare -a LINKS=(
  "${HOME}/.zshrc::${DOTFILES_DIR}/.zshrc"
  "${HOME}/.zlogin::${DOTFILES_DIR}/.zlogin"
  "${HOME}/.zshenv::${DOTFILES_DIR}/.zshenv"
  "${HOME}/.zprofile::${DOTFILES_DIR}/.zprofile"
  "${HOME}/.config/git::${DOTFILES_DIR}/.config/git"
  "${HOME}/.inputrc::${DOTFILES_DIR}/.inputrc"
  "${HOME}/.tigrc::${DOTFILES_DIR}/.tigrc"
  "${HOME}/.tmux.conf::${DOTFILES_DIR}/.tmux.conf"
  "${HOME}/.bundle::${DOTFILES_DIR}/.bundle"
  "${HOME}/.config/karabiner::${DOTFILES_DIR}/.config/karabiner"
  "${HOME}/bin::${DOTFILES_DIR}/bin"
  "${HOME}/Library/Application Support/Code/User/settings.json::${DOTFILES_DIR}/vscode/settings.json"
  "${HOME}/Library/Application Support/Code/User/keybindings.json::${DOTFILES_DIR}/vscode/keybindings.json"
  "${HOME}/Library/Application Support/Code/User/snippets::${DOTFILES_DIR}/vscode/snippets"
  "${HOME}/.config/nvim::${DOTFILES_DIR}/vimdir"
  "${HOME}/.ideavimrc::${DOTFILES_DIR}/.ideavimrc"

#  "${HOME}/.config/wezterm::${DOTFILES_DIR}/.config/wezterm"
#  "${HOME}/.config/ghostty::${DOTFILES_DIR}/.config/ghostty"
#  "${HOME}/.config/pet::${HOME}/Dropbox/_config/pet"  # privateなgithubにおく
)

conflict_detected=0

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
    echo "[error] ${dest} は既存リンク (${current}) を指しています。必要に応じて手動で処理してください。" >&2
    conflict_detected=1
    return
  fi

  if [[ -e "${dest}" ]]; then
    echo "[error] ${dest} に既存のファイルまたはディレクトリが存在するためリンクを作成できません。" >&2
    conflict_detected=1
    return
  fi

  ln -s "${src}" "${dest}"
  echo "[link] ${dest} -> ${src}"
}

for entry in "${LINKS[@]}"; do
  [[ -z "${entry}" ]] && continue
  dest="${entry%%::*}"  # :: より左側
  src="${entry#*::}"    # :: より右側

  # echo ensure_link "${dest}" "${src}"
  ensure_link "${dest}" "${src}"
done

if (( conflict_detected )); then
  echo "[error] 競合が発生したリンクがあります。上記メッセージを確認してください。" >&2
  exit 1
fi
