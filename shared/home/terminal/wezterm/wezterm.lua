local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.color_scheme = 'Noctalia'
config.window_background_opacity = 0.67
config.enable_tab_bar = false
return config
