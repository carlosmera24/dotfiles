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
    end
}

