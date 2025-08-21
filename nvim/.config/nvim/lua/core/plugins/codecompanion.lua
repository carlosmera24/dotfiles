return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        -- Estas dependencias ya están incluidas por telescope y separado
        -- "nvim-lua/plenary.nvim",
        -- "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat" },
    keys = {
        { "<leader>cc", ":CodeCompanion<CR>", desc="Open prompt CodeCompanion" },
        { "<leader>ccA", ":CodeCompanionActions<CR>", desc="Open actions menu CodeCompanion" },
        { "<leader>ccC", ":CodeCompanionChat<CR>", desc="Open Chat CodeCompanion" },
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
        },
    },
}
