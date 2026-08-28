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
        "monitor_w - (monitor_w * 0.3)",
        "monitor_h * 0.045"
    },
    size    = {
        "monitor_w * 0.3",
        "monitor_h * 0.94"
    },
    -- popin: scale from center; opt= percentage; Ex: "popin 87%"
    -- gnomed: Popup, open from center.
    -- slide: Slide from border; opt= top, bottom, left, right; Ex: "slide left"
    animation   = "gnomed",
})
