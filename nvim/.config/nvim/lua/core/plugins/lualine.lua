return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            -- Utilizado y definido en telescope
            "nvim-tree/nvim-web-devicons",
            -- Integración con codecompanion
            "franco-ruggeri/codecompanion-lualine.nvim",
        },
        config = function()
            require("lualine").get_config()
            require("lualine").setup({
                sections = {
                    lualine_x = {
                        {
                            "codecompanion",
                            icon = " ",
                            spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                            done_symbol = "✓",
                        },
                    },
                }
            })
        end
    },
}
