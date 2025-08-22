return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        -- Estas dependencias ya están incluidas por telescope y separado
        -- "nvim-lua/plenary.nvim",
        -- "nvim-treesitter/nvim-treesitter",

        -- Plugin para renderizar Markdown en Neovim
        {
            "MeanderingProgrammer/render-markdown.nvim",
            ft = { "markdown", "codecompanion" }
        },

       -- Permite pegar imágenes desde el portapapeles en buffers de Neovim
        {
            "HakonHarnes/img-clip.nvim",
            opts = {
                filetypes = {
                    codecompanion = {
                        prompt_for_file_name = false,
                        template = "[Image]($FILE_PATH)",
                        use_absolute_path = true,
                    },
                },
            },
        },
    },
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat" },
    keys = {
        { "<leader>cc", mode= { "n", "v"}, ":CodeCompanion<CR>", desc="Open prompt CodeCompanion" },
        { "<leader>ccA", mode= { "n", "v"}, ":CodeCompanionActions<CR>", desc="Open actions menu CodeCompanion" },
        { "<leader>ccC", mode= { "n", "v"}, ":CodeCompanionChat<CR>", desc="Open Chat CodeCompanion" },
    },
    opts = {
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    model = "qwen2.5-coder:1.5b",
                })
            end
        },
        display = {
            chat = {
                window = {
                    layout = "vertical",
                    position = "right",
                    width = 0.35
                }
            },
            action_palette = {
                width = 95,
                height = 10,
                prompt = "Prompt ", -- Prompt used for interactive LLM calls
                provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                opts = {
                    show_default_actions = true, -- Show the default actions in the action palette?
                    show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                    title = "CodeCompanion actions", -- The title of the action palette
                },
            },
            inline = {
                layout = "horizontal"
            }
        },
    },
}
