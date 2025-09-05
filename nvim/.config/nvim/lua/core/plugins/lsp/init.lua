return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Manage installation of language servers
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Snippets cargado en archivo separado mini-nvim.lua
        { 'nvim-mini/mini.nvim', version = false },
    },
    config = function()
        require('core.plugins.lsp.config').setup()
    end
}
