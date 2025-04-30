local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return {
	default_prog = { "wsl" },
	default_cwd = "\\\\wsl.localhost\\Ubuntu\\home\\jeswins",
	unicode_version = 14,
	adjust_window_size_when_changing_font_size = true,
	-- color_scheme = "iceberg-dark",
	color_scheme = "Rebecca (base16)",
	enable_tab_bar = false,
	font_size = 11.0,
	font = wezterm.font_with_fallback({
		{ family = "JetBrainsMono Nerd Font", weight = "Light", stretch = "Normal", style = "Normal" },
	}),

	window_background_image = "\\\\wsl.localhost\\Ubuntu\\home\\jeswins\\GitHub\\dotfyles\\Images\\eva_01_retro_blurred.png",
	window_background_image_hsb = {
		brightness = 0.025,
		hue = 0.95,
		saturation = 0.75,
	},
	-- window_background_opacity = 0.99,
	window_background_opacity = 1.0,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "F11",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "'",
			mods = "CTRL",
			action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
