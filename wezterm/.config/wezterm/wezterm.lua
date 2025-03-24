-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'

config.font = wezterm.font('Fira Code' , { weight="Medium", stretch="Normal", italic=false })
config.font_rules = {
    -- Fuente normal (Fira Code Medium)
    {
        intensity = "Normal",
        italic = false,
        font = wezterm.font("Fira Code", { weight = "Medium", stretch = "Normal", italic = false }),
    },
    -- Fuente en negrita (Cascadia Code Bold)
    {
        intensity = "Bold",
        italic = false,
        font = wezterm.font("Cascadia Code", { weight = "Bold", stretch = "Normal", italic = false }),
    },
    -- Fuente en cursiva (Cascadia Code Italic)
    {
        intensity = "Normal",
        italic = true,
        font = wezterm.font("Cascadia Code", { weight = "Regular", stretch = "Normal", italic = true }),
    },
    -- Fuente en negrita y cursiva (Cascadia Code Bold Italic)
    {
        intensity = "Bold",
        italic = true,
        font = wezterm.font("Cascadia Code", { weight = "Bold", stretch = "Normal", italic = true }),
    },
}

-- Font size dependiendo del sistema operativo
local target_os = wezterm.target_triple

if string.find(target_os, "apple") then
    -- macOS
    config.font_size = 18
elseif string.find(target_os, "linux") then
    -- Linux
    config.font_size = 12
else
    -- Default
    config.font_size = 13
end


config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
