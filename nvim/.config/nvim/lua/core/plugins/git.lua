return {
    -- visualizar cambios en la edición
    -- Reemplazado por gitsigns
    -- 'airblade/vim-gitgutter',

    -- gestionar git desde vim
    {
        'tpope/vim-fugitive',
        cmd = { "G", "Git"  }
    },
    -- Mostrar cambios en el còdigo
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup()

            -- Maps
            local map = vim.keymap.set
            map('n', '<leader>hi', ':Gitsigns preview_hunk_inline<CR>', {})
            map('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', {})
            map('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>', {})
            map('n', '<leader>tw', ':Gitsigns toggle_word_diff<CR>', {})
            map('n', '<leader>hd', ':Gitsigns diffthis<CR>', {})
            map('n', '<leader>hD', function ()
                local gitsigns = require('gitsigns')
                gitsigns.diffthis('~')
            end, {})
        end
    }
}
