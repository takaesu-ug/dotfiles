-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'Hybrid'
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'

-- フォント
config.font_size = 17.0
config.font = wezterm.font 'JetBrains Mono'

-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.85

-- config.enable_scroll_bar = true
-- config.tab_bar_at_bottom = true

-- and finally, return the configuration to wezterm
return config
