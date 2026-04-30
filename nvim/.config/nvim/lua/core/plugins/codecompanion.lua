-- Models disponibles o testeados, require correr
-- `ollama pull [modelo]`, esto para la primera vez
local models = {
    qwen2_5 = "qwen2.5-coder:1.5b",
    deepseek_coder = "deepseek-coder:1.3b"
}

-- Modeo a utilizar
local model = models.deepseek_coder

return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        -- Estas dependencias ya están incluidas por telescope y separado
        -- "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",

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
        language = "Spanish",
        opts = {
            send_code = true,
        },
        interactions = {
            chat = {
                adapter = "ollama",
                model = model,
            },
            inline = {
                adapter = "ollama",
                model = model,
            },
            cmd = {
                adapter = "ollama",
                model = model,
            }
        },
        display = {
            chat = {
                -- show_settings = true, -- Genera error con YAML y treesitter
                show_tools_processing = true,
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
                    title = "CodeCompanion actions", -- The title of the action palette
                    show_preset_actions = true, -- Show the default actions in the action palette?
                    show_preset_prompts = true, -- Show the default prompt library in the action palette?
                },
            },
            inline = {
                layout = "horizontal"
            }
        },
    },
}
