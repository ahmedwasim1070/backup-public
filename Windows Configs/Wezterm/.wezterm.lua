local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Configuration
config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 12.5

-- Window Appearance
config.window_background_opacity = 0.90
config.colors = {
	background = "#000000",
	-- Explicitly setting a dark theme base color palette so p10k colors pop nicely 
	-- and don't blend into the pure black background.
	foreground = "#c0caf5",
	cursor_bg = "#c0caf5",
	cursor_fg = "#1a1b26",
	cursor_border = "#c0caf5",
}

-- Window Sizing (Large default size)
-- 120 columns by 32 rows gives a spacious, comfortable canvas on most modern displays
config.initial_cols = 120
config.initial_rows = 32

-- FIX: Use "RESIZE" for a borderless look that still allows snapping/resizing
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

-- Center the Window on Startup
-- This event listener grabs your screen's dimensions and calculates the exact center offset
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	
	-- Get the dimensions of the primary screen
	local screens = wezterm.gui.screens()
	local active_screen = screens.primary or screens.main
	
	if active_screen then
		local screen_width = active_screen.width
		local screen_height = active_screen.height
		
		-- Fetch the pixel dimensions of the newly spawned Wezterm window
		local window_dims = gui_window:get_dimensions()
		local win_width = window_dims.pixel_width
		local win_height = window_dims.pixel_height
		
		-- Calculate the center position coordinates
		local x = (screen_width - win_width) / 2
		local y = (screen_height - win_height) / 2
		
		-- Set the position
		gui_window:set_position(x, y)
	end
end)

return config
