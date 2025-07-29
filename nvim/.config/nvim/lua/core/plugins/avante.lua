return {
    {
        "yetone/avante.nvim",
        -- event = "VeryLazy", -- Eliminado "VeryLazy" para que no se ejecute/cargue al iniciar,
        event = {},
        cmd = { "AvanteAsk", "AvanteEdit", "AvanteSwitchProvider" }, -- Carga al ejecutar estos comandos
        -- cargar al ejecutar estos comandos
        keys = {
            { "<Space>aa", mode = { "n" ,"v" }, function() require("avante.api").ask() end, desc = "Avante Ask" },
            { "<leader>ae", mode = "v", function() require("avante.api").edit() end, desc = "Avante Edit" },
        },
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- "openai" "claude", "gemini", "copilot", etc.
            provider = "copilot",
            providers = {
                openai = {
                    endpoint = "https://api.openai.com/v1",
                    model = "gpt-4o",
                    extra_request_body = {
                        timeout = 30000,
                        temperature = 0.75,
                        max_completion_tokens = 8192,
                    },
                },
                gemini = {
                    endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
                    model = "gemini-2.5-flash",
                    extra_request_body = {
                        timeout = 30000,
                        temperature = 0.75,
                        max_completion_tokens = 8192,
                    },
                },
            },
            behaviour = {
                auto_suggestions = false,
            },
            windows = {
                width = 35,
                edit = {
                    border = "rounded",
                },
                ask = {
                    border = "rounded",
                },
                input = {
                    prefix = "| ",
                    height = 10, -- Height of the input window in vertical layout
                },
            }
        },
        build = "make", -- or "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" for Windows
        dependencies = {
         "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",

            "stevearc/dressing.nvim",
            "MunifTanjim/nui.nvim",

            -- Optional para providers
            "github/copilot.vim",

            -- Optional dependencies for enhanced functionality
            -- "hrsh7th/nvim-cmp", -- Autocompletion support
            -- "nvim-tree/nvim-web-devicons", -- Icons

            "HakonHarnes/img-clip.nvim", -- Image pasting support
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
}
