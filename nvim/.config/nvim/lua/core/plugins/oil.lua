return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
        -- Definido en telescope
        -- "nvim-tree/nvim-web-devicons"
    },
    keys = {
        -- Apertura del explorador de forma flotante en modo normal
        { '-', ':Oil --float<CR>', mode = { "n" }, desc = "Open parent directory" },
    },
    cmd = { "Oil" },
    config = function()
        require("oil").setup({
            float = {
                padding = 2,
                border = "rounded", -- "none", "single", "double", "rounded"
            }
        })
    end
}
