return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            -- Utilizado y definido en telescope
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").get_config()
            require("lualine").setup()
        end
    },
}
