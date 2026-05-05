local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Configuration
config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 12.5

-- Window Appearance
config.window_background_opacity = 0.90
config.colors = {
	background = "#000000",
}

-- FIX: Use "RESIZE" for a borderless look that still allows snapping/resizing
-- Use "NONE" if you want absolutely no buttons or borders at all
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 25,
	right = 25,
	top = 25,
	bottom = 25,
}

-- Performance & Integration
config.default_prog = { "pwsh.exe", "-NoLogo" }
config.scrollback_lines = 5000
config.enable_tab_bar = false

return config
