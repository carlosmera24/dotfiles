return {
    {
        'numToStr/Comment.nvim',
        keys = {
            { 'gcc', mode = {"n","v"}, desc = "Line-comment toggle keymap" },
            { 'gbc', mode = {"n","v"}, desc = "Block-comment toggle keymap" },
            { 'gc', mode = {"v"}, desc = "Line-comment keymap" },
            { 'gb', mode = {"v"}, desc = "Block-comment keymap" },
        },
        config = function()
            require("Comment").setup({
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true,
                },
            })
        end
    }
}
