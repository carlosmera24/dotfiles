return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require('luasnip')
        cmp.setup({
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
            mapping = {
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-y>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-space>"] = cmp.mapping.complete(),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
                { name = "buffer" },
            },
        })
    end,
}
