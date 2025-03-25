return {
    {
        "ellisonleao/glow.nvim",
        cmd = { "Glow" },
        keys = {
            {
                '<leader>gv',
                ':Glow<CR>',
                mode = { "n" },
                desc = "Preview current mardown file with Glow",
            },
        },
        config = function()
            require("glow").setup({
                borer = "shadow",
            })
        end
    }
}
