--------------------------------
---- WINDOWS ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

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

-- Telegram rule
hl.window_rule({
    name    = "telegram-space",
    match   = { class = "org.telegram.desktop" },
    float   = true,
    move    = {
        -- Use the 30% of the screen - 5px of gaps 
        "monitor_w - (monitor_w * 0.3) - 5",
        "41"
    },
    size    = {
        "monitor_w * 0.3",
        "monitor_h * 0.936"
    },
    -- popin: scale from center; opt= percentage; Ex: "popin 87%"
    -- gnomed: Popup, open from center.
    -- slide: Slide from border; opt= top, bottom, left, right; Ex: "slide left"
    animation   = "gnomed",
})

-- Gnome calculator
hl.window_rule({
    name    = "gnome-calcuator-space",
    match   = { class = "org.gnome.Calculator" },
    float   = true,
    size    = { 400, 650 },
    animation   = "popin"
})

-- Flameshow capture
hl.window_rule({
    name    = "flameshot-launcher-space",
    match   = { class = "flameshot", title = "Capturar Lanzador" },
    float   = true,
    move    = { "monitor_w - (monitor_w * 0.4)", 41 },
    size    = { 400, 200 },
    animation   = "slide top"
})

hl.window_rule({
    name    = "flameshot-capture-space",
    match   = { class = "flameshot", title = "flameshot" },
    float   = true,
    animation   = "popin"
})

-- MegaSync
hl.window_rule({
    name = "megasync-space",
    match   = { class = "MEGAsync" },
    float   = true,
    move    = { "monitor_w - 410", 41 },
    size    = { 400, 200 },
    animation   = "slide top"
})

hl.window_rule({
    name    = "megasync-settings-space",
    match   = { class = "MEGAsync", title = "Ajustes" },
    float   = true,
    move    = { "monitor_w - 810", 41 },
    size    = { 800, 600 },
    animation   = "popin"
})
