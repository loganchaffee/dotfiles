local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font")

config.font_size = 15

config.enable_tab_bar = false

local colors = {
	"#000000",
	"#e46d63",
	"#58c18f",
	"#e9e64d",
	"#77abd9",
	"#d38dd9",
	"#60c1de",
	"#ffffff",
}

config.colors = {
	cursor_bg = "#d3d3d3",
	cursor_border = "#d3d3d3",
	cursor_fg = "#1e1e1e",
	foreground = "#ffffff",
	background = "#1e1e1e",
	ansi = colors,
}

return config
