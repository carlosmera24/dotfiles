return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        -- Manage installation of language servers
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",

        -- Snippets cargado en archivo separado mini-nvim.lua
        { 'nvim-mini/mini.nvim', version = false },
    },
    opts = function()
        require('core.plugins.lsp.config').setup()
    end
}
