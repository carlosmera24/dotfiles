return {
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        keys = {
            --Reemplzar TAB
            -- { '<C-s>', mode = { "i" }, desc = "Insert suggestion" },
            { "<C-]>", mode = { "i" } },
            { "<M-]>", mode = { "i" } },
            { "<M-[>", mode = { "i" } },
            { "<M-Bslash>", mode = { "i" }  },
        },
        config = function ()
            -- Deshabilitar completamente el uso de TAB
            vim.g.codeium_no_map_tab = 1
            vim.g.codeium_disable_bindings = 1

            -- Re-implementar la definición de teclas para solucionar problemas con el uso de la tecla RIGHT, la cual 
            -- generaba  un tab en lugar de moverse a la derecha
            -- local function set_keymap_codeium_opts(desc, opts)
            --     opts = opts or {}
            --     local codeium_default_options = {
            --         silent = true,
            --         expr = true,
            --         desc = desc,
            --     }
            --     return vim.tbl_extend("force", codeium_default_options, opts)
            -- end
            --
            -- local function codeium_keymap_set(mode, keys, codeium_function, desc, opts, arg)
            --     opts = set_keymap_codeium_opts(desc, opts)
            --     vim.keymap.set(mode, keys, function()
            --         local status, completion_text = pcall(function()
            --             return vim.api.nvim_eval(
            --                 "b:_codeium_completions.items[b:_codeium_completions.index].completionParts[0].text"
            --             )
            --         end)
            --         if not (status and completion_text and completion_text ~= "") then
            --             return vim.api.nvim_replace_termcodes(keys, true, true, true)
            --         end
            --         if arg ~= nil then
            --             return vim.fn[codeium_function](arg)
            --         end
            --         return vim.fn[codeium_function]()
            --         end, opts)
            -- end
            --
            -- codeium_keymap_set("i", "<C-f>", "codeium#Accept", "Codeium Accept suggestion")
            -- codeium_keymap_set("i", "<A-Bslash>", "codeium#Complete", "Codeium Trigger suggestion")
            -- codeium_keymap_set("i", "<A-]>", "codeium#CycleCompletions", "Codeium Cycle completions forwards", {}, 1)
            -- codeium_keymap_set("i", "<A-[>", "codeium#CycleCompletions", "Codeium Cycle completions backwards", {}, -1)
            -- codeium_keymap_set("i", "<A-BS>", "codeium#Clear", "Codeium Clear completions")
            -- codeium_keymap_set("n", "<leader>cd", "codeium#Chat", "Codeium Open Chat")
            -- codeium_keymap_set(
            --     "i",
            --     "<Right>",
            --     "codeium#AcceptNextWord",
            --     "Codeium Accept next word",
            --     { noremap = true, replace_keycodes = false }
            -- )
            -- codeium_keymap_set(
            --     "i",
            --     "<C-Right>",
            --     "codeium#AcceptNextLine",
            --     "Codeium Accept next line",
            --     { noremap = true, replace_keycodes = false }
            -- )
            -- Re-implementar - Fin -

            -- Personalización de keymaps
            -- Reemplazar TAB autocompletado
            vim.keymap.set('i', '<C-s>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            -- vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
            -- vim.keymap.set('i', '<M-,[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
            -- vim.keymap.set('i', '<c-]>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    }
}
