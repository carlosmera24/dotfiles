return {
    {
        "iamironz/android-nvim-plugin",
        lazy = false,
        config = function()
            require("android").setup()
        end,
    },
    {
        "rizukirr/droid-nvim",
        dependencies = {
            'nvim-telescope/telescope-ui-select.nvim'
        },
        ft = { "kotlin", "java", "groovy", "xml" },
        opts = {},
        config = function()
            require("telescope").load_extension("ui-select")
            require("droid").setup()
        end,
    }
}
