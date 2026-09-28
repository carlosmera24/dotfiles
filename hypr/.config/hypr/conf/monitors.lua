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

-- TV Samsung arriba en el centro del desktop
hl.monitor({
    output   = "desc:Samsung Electric Company SAMSUNG 0x00000001",
    mode     = "1920x1080@60",
    position = "auto-center-up",
    scale    = "1",
})

-- Monitor por default - extra
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
