-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Laptop
hl.monitor({
    output   = "eDP-1",
    mode     = "1366x768@60",
    position = "0x0",
    scale    = "1",
})

-- Desktop DVI a la izquiera y HDMI a la derecha 
hl.monitor({
    output   = "DVI-D-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "1920x0",
    scale    = "1",
})

-- Monitor por default - extra
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "foot"
local fileManager = "nemo"
local menu        = "hyprlauncher"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  -- hl.exec_cmd(terminal)
  -- hl.exec_cmd("waybar & hyprpaper & firefox")
  -- hl.exec_cmd("nm-applet")
  -- hl.exec_cmd("ashell & nm-applet & mako")

  -- Ashell y nm-applet
  hl.exec_cmd("ashell & nm-applet & blueman-applet")

  -- Activar notificaciones try para ashell 
  hl.exec_cmd("/usr/lib/libdbusmenu-gtk3/status-notifier-watcher")

  -- Wallpaper --
  hl.exec_cmd("wpaperd")

  -- Bloqueo de pantalla --
  -- hypridle - cambio la gestión del bloqueo de pantalla para una integración más nativa
  hl.exec_cmd("hypridle")

  -- genome-keyring
  -- exec-once = sh -c 'eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)"; export SSH_AUTH_SOCK'
  hl.exec_cmd("gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg")
  hl.exec_cmd("dbus-update-activation-environment") --systemd SSH_AUTH_SOCK DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

  -- Cursor, requiere instalar volantes-cursor (AUR) o descargar y copiar en /usr/share/icons
  hl.exec_cmd("hyprctl setcursor volantes_cursors 24")

  -- Polkit
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- Notificador personalizado de batería baja
  hl.exec_cmd("~/.config/myscripts/battery-notify.sh")

  -- Definir workspace por default, solución alternativa para no usar default:true en workspaces,
  -- ya que genera conflicto entre equipos, y solo tomará como default el primer workspace definido
  hl.exec_cmd("hyprctl dispatch 'hl.dsp.focus({ workspace = 1 })'")
  -- Snappy
  hl.exec_cmd("snappy-switcher --daemon")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- hl.env("XCURSOR_SIZE", "24")
-- hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        -- kb_layout  = "us",
        -- kb_variant = "",
        -- kb_model   = "",
        -- kb_options = "",
        -- kb_rules   = "",

        -- Cambia el foco de la ventana al posiciionar el cursor, por fecto 1   
        --  0: el movimiento del cursor no cambiará el foco.
        --  1: el movimiento del cursor siempre cambiará el foco a la ventana situada debajo del cursor.
        --  2: el foco del cursor se separará del foco del teclado. Al hacer clic en una ventana, el foco del teclado se desplazará a esa ventana.
        --  3: el foco del cursor estará completamente separado del foco del teclado. Al hacer clic en una ventana, el foco del teclado no cambiará.
        follow_mouse = 2,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- Teclado Notebook HP
hl.device{
    name = "at-translated-set-2-keyboard",
    kb_layout = "latam"
}

-- Teclado Desktop ArchLinux
hl.device{
    name = "sin-mechanical-keyboard",
    kb_layout = "latam"
}
hl.device{
    name = "sin-mechanical-keyboard-2",
    kb_layout = "latam"
}
hl.device{
    name = "sino-wealth-mechanical-keyboard",
    kb_layout = "latam"
}
hl.device{
    name = "sin-mec",
    kb_layout = "latam"
}
hl.device{
    name = "sin-mec-keyboard",
    kb_layout = "latam"
}
hl.device{
    name = "sino-wealth-mec",
    kb_layout = "latam"
}
hl.device{
    name = "sino-wealth-mec-keyboard",
    kb_layout = "latam"
}
hl.device{
    name = "sino-wealth-mechanical-keyboard",
    kb_layout = "latam"
}
hl.device{
    name = "sino-wealth-mechanical-keyboard-2",
    kb_layout = "latam"
}

-- Macbook
hl.device {
    name = "apple_inc._apple_internal_keyboard_/_trackpad",
    kb_layout = "es"
}

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

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- local suppressMaximizeRule = hl.window_rule({
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

------------------
--- Workspaces ---
------------------
-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- Desktop set workspaces
hl.workspace_rule({
    workspace = "1", monitor = "DVI-D-1"
})
hl.workspace_rule({
    workspace = "2", monitor = "HDMI-A-1"
})
-- Laptop set workspaces
-- hl.workspace_rule({
--     workspace = "", monitor = "eDP-1"
-- })
