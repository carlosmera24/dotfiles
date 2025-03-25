return {
    {
        "ap/vim-buftabline",
        config = function()
            vim.g.buftabline_numbers = 1 --Numero del buffer
            vim.g.buftabline_indicators = 1 --Indicador de modificación
            vim.g.buftabline_separators = 1 --Separador

            --Solución para archivos php lentos
            --let g:loaded_matchparen = 1
        end
    }, 
}
