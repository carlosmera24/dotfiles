return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
                config = function()
                    require('ts_context_commentstring').setup {
                        enable_autocmd = false,
                    }
                    vim.g.skip_ts_context_commentstring_module = true
                end
            },
        },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Decrement selection", mode = "x" },
        },
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = { "markdown" }
            },
            indent = {
                enable = true,
                disable = { "python", "json" }
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",--Seleccionar la función externa
                        ["if"] = "@function.inner",--Seleccionar la función interna
                        ["ac"] = "@conditional.outer",--Seleccionar la condición externa
                        ["ic"] = "@conditional.inner",--Seleccionar la condición interna
                        ["al"] = "@loop.outer",--Seleccionar el bucle externo
                        ["il"] = "@loop.inner",--Seleccionar el bucle interno
                    },
                },
            },
            --[[ JoosepAlviste/nvim-ts-context-commentstring genera:
            context_commentstring nvim-treesitter module is deprecated, use use require('ts_context_commentstring').setup {}
            and set vim.g.skip_ts_context_commentstring_module = true to speed up loading instead.
            This feature will be removed in ts_context_commentstring version in the future ]]
            --[[ context_commentstring = {
                enable = true,
                enable_autocmd = true,
            }, ]]
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<nop>",
                    node_decremental = "<bs>",
                },
            },
            ensure_installed = {
                -- c, lua, vim son parte de la funcionalidad de neovim, requeridos e indispensables
                "c",
                "css",
                "html",
                "javascript",
                "json", -- se habilitan la visualización de comillas en indentline.
                "lua",
                "kotlin",
                "markdown",
                "php",
                "scss",
                "typescript",
                "vim",
                "vue",
                "python",
                "yaml",
            },
        },
        config = function(_,opts)
            require("nvim-treesitter.configs").setup(opts)
       end
    },
}
