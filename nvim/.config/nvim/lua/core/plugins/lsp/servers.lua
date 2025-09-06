local lsp_flags = {
    debounce_text_changes = 150,
}

local default = function()
    return {
        flags = lsp_flags,
    }
end

return {
    ["emmet_ls"] = function()
        -- Blade requiere configuración adicional agregada para LSP con la función setup_emmet_for_blade() 
        return {
            flags = lsp_flags,
            filetypes = {
                "html",
                "php",
                "typescriptreact",
                "javascriptreact",
                "css",
                "sass",
                "scss",
                "less",
                "blade",
                "vue"
            },
            init_options = {
                html = {
                    options = {
                        ["bem.enabled"] = true, -- Opcional: habilita soporte para BEM
                    },
                },
                embeddedLanguages = {
                    blade = "html"
                }
            }
        }
    end,
    ["lua_ls"] = function()
        return {
            flags = lsp_flags,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end,
    ["jsonls"] = default,
    ["marksman"] = default,--markdown
    ["html"] = default,
    ["svelte"] = default, --css, scss, less, js, html,
    ["tailwindcss"] = default, --css
    ["cssls"] = default, --css
    ["ts_ls"] = default, -- js
    -- Requiere configuración manual de ts_ls agregada a config.lua
    ["vue_ls"] = default, --vue
    ["intelephense"] = default, -- php
    ["phpactor"] = function()
        return {
            flags = lsp_flags,
            filetypes = { "php", "cucumber" },
        }
    end,
    ["pyright"] = default, -- python
}
