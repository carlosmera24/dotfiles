local lspconfig = require("lspconfig")
local servers = require("core.plugins.lsp.servers")

local lsp_flags = {
    debounce_text_changes = 150,
}

-- Inicializar capabilities con mini.completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp_status, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_lsp_status then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Asegurar que documentSymbol esté habilitado
capabilities.textDocument.documentSymbol = {
  dynamicRegistration = false,
  symbolKind = {
    valueSet = vim.tbl_values(vim.lsp.protocol.SymbolKind)
  }
}
-- Función para iniciar Emmet en archivos blade
local function setup_emmet_for_blade()
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = {"*.blade.php"},
        callback = function()
            vim.lsp.start({
                name = "emmet_ls",
                cmd = { "emmet-ls", "--stdio" },
                filetypes = { "blade" },
                capabilities = capabilities,
                flags = lsp_flags
            })
        end,
    })
end

-- Función para confiugrar tl_sl y solucionar error `Could not find ts-ls...` al abrir archivos .vue
local function setup_tl_sl_vue()
    local mason_path = vim.fn.stdpath('data') .. '/mason'  -- ~/.local/share/nvim/mason
    local vue_server_path = mason_path .. '/packages/vue-language-server/node_modules/@vue/language-server'

    -- Verificar que la carpeta exista
    if vim.fn.isdirectory(vue_server_path) == 0 then
        vim.notify('Vue language server plugin no encontrado en: ' .. vue_server_path, vim.log.levels.WARN)
        return
    end

    -- Configurar ts_ls con el plugin de Vue
    lspconfig.ts_ls.setup {
        init_options = {
            plugins = {
                {
                    name = '@vue/typescript-plugin',
                    location = vue_server_path,
                    languages = { 'vue' },
                },
            },
        },
        filetypes = {
            'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'
        },
        flags = lsp_flags,
        capabilities = capabilities,
    }
end

-- Función para configurar vue(vue_ls)
local function setup_vue_ls()
    lspconfig.vue_ls.setup {
        init_options = {
            vue = {
                hybridMode = false,
            },
        },
        filetypes = { "vue" },
        flags = lsp_flags,
        capabilities = capabilities,
}
end

-- Configuración pincipal
local M = {}

M.setup = function()
    -- Configurar Mason
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {}
    })

    -- Configurar cada servidor
    for server, config_fn in pairs(servers) do
        -- excluir vue_ls y ts_ls (los configuramos manualmente después)
        if server ~= "vue_ls" and server ~= "ts_ls" then
            local setup_opts = type(config_fn) == "function" and config_fn() or {}

            -- Asegurarse de que capabilities esté fusionado
            setup_opts.capabilities = vim.tbl_deep_extend(
                "force",
                capabilities,
                setup_opts.capabilities or {}
            )

            -- Asegurar flags
            setup_opts.flags = vim.tbl_deep_extend(
                "force",
                lsp_flags,
                setup_opts.flags or {}
            )

            -- Aplicar configuración
            lspconfig[server].setup(setup_opts)
        end
    end

    -- Configurar tl_sl y vue
    setup_tl_sl_vue()
    setup_vue_ls()

    -- Emmet para Blade
    setup_emmet_for_blade()

    -- Diagnostics
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '✘',
                [vim.diagnostic.severity.WARN] = '▲',
                [vim.diagnostic.severity.HINT] = '⚑',
                [vim.diagnostic.severity.INFO] = '»',
            },
        },
        virtual_text = true,
        underline = true,
        update_in_insert = false,
    })
end

return M
