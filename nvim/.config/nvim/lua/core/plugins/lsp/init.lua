return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        -- Manage installation of language servers
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",

        -- Snippets cargado en archivo separado mini-nvim.lua
        { 'nvim-mini/mini.nvim', version = false },

        -- Plugin para auto-configurar pyright(python) con entornos virtuales
        {
            "linux-cultist/venv-selector.nvim",
            -- Dependencias instaladas independientemente
            -- dependencies = {
            --     {
            --         "nvim-telescope/telescope.nvim",
            --         version = "*",
            --         dependencies = { "nvim-lua/plenary.nvim" }
            --     },
            -- },
            ft = "python", -- Load when opening Python files
            keys = {
                { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select virtualenv" },
            }, -- Open picker on keymap
            opts = {
                options = {}, -- plugin-wide options
                search = {}   -- custom search definitions
            },
        }
    },
    opts = function()
        require('core.plugins.lsp.config').setup()
    end
}
