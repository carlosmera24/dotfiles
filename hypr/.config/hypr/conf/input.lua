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
