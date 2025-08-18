local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Maple Mono NF", { weight = "Light"})
config.font_size = 11
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
--config.window_decorations = "NONE" -- for nothing 
config.color_scheme = "Catppuccin Mocha"
config.default_domain = 'WSL:Arch'
config.default_prog = { 'wsl.exe' }
config.window_background_opacity = 0.95
config.window_padding ={
    left =20,
    right =20,
    top = 10,
    bottom = 10,
}

return config