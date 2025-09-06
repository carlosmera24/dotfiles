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
    end
}

