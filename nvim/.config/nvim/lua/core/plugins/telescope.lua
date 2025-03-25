return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-tree/nvim-web-devicons",
            -- Search terms/text with filter ripgrep(rg)
            {
                'nvim-telescope/telescope-live-grep-args.nvim',
                keys = {
                    {
                        '<leader>fs',
                        ':lua require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()<CR>',
                        mode = { "v" },
                        desc = "Start live grep with visual selection.",
                    },
                }
            },
            'sharkdp/fd',
            {
                "nvim-telescope/telescope-file-browser.nvim",
                keys = {
                    { '<leader>fe', ':Telescope file_browser<CR>', desc='Open telescope file browser' },
                    {
                        '<leader>fce',
                        ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
                        desc='Open telescope file browser with the path of the current buffer'
                    },
                },
            }
        },
        keys = {
            { '<leader>ff', ':Telescope find_files<CR>' },
            { '<leader>fg', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>' },
            { '<leader>fb', ':Telescope buffers<CR>' },
            { '<leader>fh', ':Telescope help_tags<CR>' },
            {
                '<leader>fs',
                ':Telescope grep_string<CR>',
                mode = { "n" },
                desc = "Start live grep with word under cursor.",
            },
        },
        cmd = { "Telescope" },
        config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        theme = "ivy", -- dropdown, cursor, ivy, floating
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mapping
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                            },
                        },
                    },
                },
            }
            -- To get telescope-file-browser loaded and working with telescope,
            -- you need to call load_extension, somewhere after setup function:
            require("telescope").load_extension("file_browser")
            -- Search with filter on live grep 
            require("telescope").load_extension("live_grep_args")
        end
    }
}
