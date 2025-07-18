-- plugins/configs/ale.lua

-- エラー表示設定
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = '⚠'
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_sign_column_always = 1

-- 実行タイミング
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 'never'

-- List設定
vim.g.ale_set_loclist = 1
vim.g.ale_set_quickfix = 0
vim.g.ale_open_list = 0
vim.g.ale_keep_list_window_open = 0

-- ステータス表示
vim.g.ale_statusline_format = {'✗ %d', '⚠ %d', '⬥ ok'}
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'

-- 自動修正
vim.g.ale_fix_on_save = 1

-- リンター設定
vim.g.ale_linters = {
  python = {'flake8', 'mypy'},
}

-- フィクサー設定
vim.g.ale_fixers = {
  python = {'autopep8', 'isort'},
  javascript = {'prettier'},
}

-- Ruby用rubocop設定
vim.g.ale_ruby_rubocop_executable = '.bin/rubocop'