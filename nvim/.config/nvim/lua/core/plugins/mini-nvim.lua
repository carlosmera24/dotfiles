-- Función para configurar mini.hipatterns
local hipatterns_setup = function()
    local hipatterns = require('mini.hipatterns')

    -- Lista de palabras -> colores
    local color_words = {
        red     = "#ff0000",
        green   = "#00ff00",
        blue    = "#0000ff",
        yellow  = "#ffff00",
        orange  = "#ffa500",
        purple  = "#800080",
        pink    = "#ffc0cb",
        black   = "#000000",
        white   = "#ffffff",
        gray    = "#808080",
        cyan    = "#00ffff",
        magenta = "#ff00ff",
    }

    -- Función para mapear palabra -> color
    local word_color_group = function(_, match)
        local hex = color_words[match:lower()]
        if hex == nil then return nil end
        -- fg aplica color a la palabra y bg al fondo
        return hipatterns.compute_hex_color_group(hex, 'fg')
    end

    -- Función para mapear rgb/rgba -> color
    local rgb_color_group = function(_, match)
        -- Extraer números dentro de rgb(...)
        local r, g, b, a = match:match("rgba?%((%d+),%s*(%d+),%s*(%d+),?%s*([%d%.]*)%)")
        if not r or not g or not b then return nil end

        r, g, b = tonumber(r), tonumber(g), tonumber(b)
        if not r or not g or not b then return nil end

        -- Convertir a hex
        local hex = string.format("#%02x%02x%02x", r, g, b)
        return hipatterns.compute_hex_color_group(hex, 'bg')
    end

    -- Conversión HSL → RGB (0-360, 0-100, 0-100)
    local function hsl_to_rgb(h, s, l)
        s = s / 100
        l = l / 100
        local c = (1 - math.abs(2 * l - 1)) * s
        local x = c * (1 - math.abs((h / 60) % 2 - 1))
        local m = l - c / 2

        local r, g, b = 0, 0, 0
        if h < 60 then r, g, b = c, x, 0
        elseif h < 120 then r, g, b = x, c, 0
        elseif h < 180 then r, g, b = 0, c, x
        elseif h < 240 then r, g, b = 0, x, c
        elseif h < 300 then r, g, b = x, 0, c
        else r, g, b = c, 0, x
        end

        return (r + m) * 255, (g + m) * 255, (b + m) * 255
    end

    -- Grupo para hsl()/hsla()
    local hsl_color_group = function(_, match)
        local h, s, l, a = match:match("hsla?%((%d+),%s*(%d+)%%,%s*(%d+)%%,?%s*([%d%.]*)%)")
        if not h or not s or not l then return nil end

        h, s, l = tonumber(h), tonumber(s), tonumber(l)
        local r, g, b = hsl_to_rgb(h, s, l)

        local hex = string.format("#%02x%02x%02x", r, g, b)
        return hipatterns.compute_hex_color_group(hex, 'bg')
    end

    hipatterns.setup({
        highlighters = {
            -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
            fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
            todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
            note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),

            -- Palabras de colores (en inglés)
            word_color = { pattern = '%a+', group = word_color_group },

            -- rgb()/rgba()
            rgb_color = { pattern = 'rgba?%b()', group = rgb_color_group },

            -- hsl()/hsla()
            hsl_color = { pattern = 'hsla?%b()', group = hsl_color_group },
        },
    })
end

return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        -- Autocompletion
        require('mini.icons').setup({})
        require('mini.snippets').setup({
        })
        require('mini.completion').setup({
        })

        --Comentarios
        require('mini.comment').setup({
            mappings = {
                comment = 'gc',
                comment_line = 'gcc',
                comment_visual = 'gc',
                textobject = 'gc',
            },
        })

        -- Tabline
        require('mini.tabline').setup({
            -- Whether to show file icons (requires 'mini.icons')
            show_icons = true,

            -- Function which formats the tab label
            -- By default surrounds with space and possibly prepends with icon
            format = nil,

            -- Where to show tabpage section in case of multiple vim tabpages.
            -- One of 'left', 'right', 'none'.
            tabpage_section = 'left',
        })

        -- Autopairs
        require('mini.pairs').setup({})

        -- Notify
        require('mini.notify').setup({})

        -- Highlight patterns in text (like TODO, HACK, NOTE, FIXME, etc.) and Colors names/rgb/rgba
        hipatterns_setup()

        -- Indent scope (Visualize and work)
        require('mini.indentscope').setup({})

        -- Split and join arguments
        require('mini.splitjoin').setup({})

        -- Surround
        require('mini.surround').setup({})

        -- Keys
        local map_multistep = require('mini.keymap').map_multistep

        map_multistep('i', '<Tab>',   { 'pmenu_next' })
        map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
        map_multistep('i', '<CR>',    { 'pmenu_accept' })
    end
}

