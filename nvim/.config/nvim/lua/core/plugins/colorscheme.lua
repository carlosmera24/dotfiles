return {
    {
        -- "arcticicestudio/nord-vim",
        'folke/tokyonight.nvim',
        lazy = false, --Cargar durante el inicio, ya que es un tema principal
        priority = 1000, -- Asegurarse que se cargue antes que otros plugins
        config = function()
            -- definir el tema/colorscheme
            -- vim.cmd([[colorscheme nord]])
            vim.cmd([[colorscheme tokyonight-moon]])
        end
    },
}
