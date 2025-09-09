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

        -- Highlight patterns in text (like TODO, HACK, NOTE, FIXME, etc.)
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
                todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
                note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })

        -- Indent scope (Visualize and work)
        require('mini.indentscope').setup({})

        -- Keys
        local map_multistep = require('mini.keymap').map_multistep

        map_multistep('i', '<Tab>',   { 'pmenu_next' })
        map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
        map_multistep('i', '<CR>',    { 'pmenu_accept' })
    end
}

