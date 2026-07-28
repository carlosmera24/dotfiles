---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "foot"
local fileManager = "nemo"
local menu        = "hyprlauncher"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local modAlt = "ALT"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
-- local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .." + SHIFT + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
local dialogExit = [[
    swaynag --background cad3f5 --text 24273a \
    --button-background 939ab7 --border 6e738d --button-text 24273a \
    -m "Salir. Cerrar la sesión de Hyprland?" \
    -B "Si, salir" "hyprctl dispatch 'hl.dsp.exit()'"
]]

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(dialogExit))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(dialogExit))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + ".. modAlt .. " + E", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----Snappy switcher----
-- Alt+Tab (standard MRU)
hl.bind(modAlt .." + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"))
-- Super+Tab (workspace-filtered)
hl.bind(mainMod .." + TAB", hl.dsp.exec_cmd("snappy-switcher next --workspace --mod super"))


----------------------------
--- Focus/Move windows ------
---------------------------- 
local function bind_directions(mods, map, callback)
    for key, direction in pairs(map) do
        hl.bind(
            mods .. key,
            callback(direction)
        )
    end
end

local directions = {
    left  = "left",
    right = "right",
    up    = "up",
    down  = "down",
    h     = "left",
    l     = "right",
    k     = "up",
    j     = "down",
}
-- Move focus with mainMod + arrow keys
bind_directions(
    mainMod .. " + ",
    directions,
    function(direction)
        return hl.dsp.focus({ direction = direction })
    end
)

-- Move windows with keyboard
bind_directions(
    mainMod .. " + SHIFT + ",
    directions,
    function(direction)
        return hl.dsp.window.move({ direction = direction })
    end
)

----------------------------
--- Resize with keyboard ---
----------------------------
-- Helper for relative resize
local function resize(x, y)
    return hl.dsp.window.resize({
        x = x,
        y = y,
        relative = true
    })
end

-- Keymap table
local resize_binds = {
    right = { 10,  0 },
    left  = { -10, 0 },
    up    = { 0,   10 },
    down  = { 0,  -10 },

    l = { 10,  0 },
    h = { -10, 0 },
    k = { 0,   10 },
    j = { 0,  -10 },
}


-- Start resize submap
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()

    for key, delta in pairs(resize_binds) do
        hl.bind(
            key,
            resize(delta[1], delta[2]),
            { repeating = true }
        )
    end

    -- Exit submap
    hl.bind("escape", hl.dsp.submap("reset"))

end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- CUSTOM KEYBINDS ---
-- Open kitty terminal
hl.bind("CONTROL + " .. modAlt .. " + K", hl.dsp.exec_cmd("kitty") )
-- Open rio terminal
hl.bind("CONTROL + " .. modAlt .. " + R", hl.dsp.exec_cmd("rio") )
-- Open terminal as others desktop 
hl.bind( "CONTROL + " .. modAlt .. " + T", hl.dsp.exec_cmd("gnome-terminal") )
-- Block screen
hl.bind( "CONTROL + " .. modAlt .. "+ L", hl.dsp.exec_cmd("hyprlock") )
-- Power botton
hl.bind( "XF86PowerOff", hl.dsp.exec_cmd("wlogout") )
-- Screenshot
hl.bind( "CONTROL + SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy --type image/png") )
hl.bind( mainMod .. " + CONTROL + SHIFT +  4", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy --type image/png") )
-- Open nwg-drawer
hl.bind("CONTROL + ".. mainMod .. " + D", hl.dsp.exec_cmd("nwg-drawer") )
hl.bind("CONTROL + ".. mainMod .. " + SPACE", hl.dsp.exec_cmd("nwg-drawer") )
