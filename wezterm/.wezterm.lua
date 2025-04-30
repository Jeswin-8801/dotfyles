local wezterm = require("wezterm")

wezterm.on("gui-startup", function()
	local tab, pane, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

return {
	wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
		},
	},
	-- default_domain = "WSL:Ubuntu",
	default_prog = { "C:\\Windows\\System32\\wsl.exe", "-d", "Ubuntu" },
	default_cwd = [[\\wsl$\Ubuntu\home\jeswins]],
	adjust_window_size_when_changing_font_size = false,
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
	default_cursor_style = "BlinkingBlock",
	disable_default_key_bindings = true,
	keys = {
		{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
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
	-- Mouse bindings to mimc Windows Terminal
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
		-- To copy just highlight something and right click. Simple
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
			mods = "NONE",
		},
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action_callback(function(window, pane)
				local has_selection = window:get_selection_text_for_pane(pane) ~= ""
				if has_selection then
					window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
					window:perform_action(act.ClearSelection, pane)
				else
					window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
				end
			end),
		},
	},
}
