return {
    {
        'junegunn/fzf',
        dependencies = 'junegunn/fzf.vim',
        keys = {
            --Abrir con leader+t
            { "<leader>t", ":FZF<CR>", desc="Open FZF, search files"},
            -- Abrir Rg busqueda con leader+F (leader+Shift+f)
            { "<leader>F", ':Rg<CR>', desc="Search text in files with Rg" },
            -- Abrir Ag busqueda con leader+G (leader+Shift+f)
            { "<leader>G", ':Ag<CR>', desc="Search text in files with Ag" }
        },
        cmd = { "Rg", "FZF", "Ag", "Maps" }
    }
}
