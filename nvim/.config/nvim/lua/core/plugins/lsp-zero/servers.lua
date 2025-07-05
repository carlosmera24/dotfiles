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

        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        return {
            flags = lsp_flags,
            capabilities = capabilities,
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
    -- ["volar"] = default, --vue
    -- Vue, instala vetur-vls, requiere configuración en init.lua para mason
    -- require('lspconfig').vls.setup({})
    ["vuels"] = default, --vue
    ["intelephense"] = default, -- php
    ["phpactor"] = function()
        return {
            flags = lsp_flags,
            filetypes = { "php", "cucumber" },
        }
    end,
    ["pyright"] = default, -- python
}
