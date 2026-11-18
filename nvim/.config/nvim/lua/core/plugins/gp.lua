local models = {
    qwen2_5 = "qwen2.5-coder:1.5b",
    deepseek_coder = "deepseek-coder:1.3b",
}

-- Modeo a utilizar
local model = models.qwen2_5
return {
    "robitx/gp.nvim",
    cmd = { "GpRewrite", "GpPrepend", "GpAppend", "GpChatNew" },
    keys = {
        { "<leader>cr", ":<C-u>'<,'>GpRewrite<CR>", mode = "v", desc = "AI Rewrite selection" },
        { "<leader>cp", ":<C-u>'<,'>GpPrepend<CR>", mode = "v", desc = "AI Prepend above selection" },
        { "<leader>cc", "<cmd>GpChatNew vsplit<CR>", mode = { "n", "v" }, desc = "AI New Chat" },
    },
    config = function()
        require("gp").setup({
            providers = {
                ollama = {
                    disable = false,
                    endpoint = "http://127.0.0.1:11434/api/chat",
                },
            },
            agents = {
                {
                    name = "QwenCoderLocal",
                    provider = "ollama",
                    chat = true,
                    command = true,
                    model = { model = model, temperature = 0.2 },
                    system_prompt = "You are a senior PHP/Laravel, JavaScript, Android, Python developer.",
                },
            },
            default_command_agent = "QwenCoderLocal",
            default_chat_agent = "QwenCoderLocal",
        })
    end,
}
