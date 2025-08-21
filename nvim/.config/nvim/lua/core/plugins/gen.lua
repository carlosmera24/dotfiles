return {
    "David-Kunz/gen.nvim",
    cmd = { "Gen" },
    keys = { { "<leader>]", ":Gen<CR>", desc="Open menu Gen" } },
    opts = {
        model = "qwen2.5-coder:1.5b",
        result_filetype = "markdown"
    },
    config = function()
        require("gen").setup({
            vim.keymap.set({'n', 'v'}, '<leader>]', ':Gen<CR>')
        })
    end
}
