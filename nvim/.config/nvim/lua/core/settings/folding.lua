local cmd = vim.cmd
-- Folding, activar como indent y permitir el uso manual para crear nuevos
-- Define foldmethod en indent para el archivo en apertura/lectura
-- Establece el foldmethod en manual para el archivo en el buffer/abierto
cmd([[
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
]])

-- Function to create fold agroup by @AO\Post
function createFoldsL5Swager()
    if vim.bo.filetype == 'php' and vim.wo.foldmethod == "manual" then
        cmd([[g/@OA\\Post/norm! V%zf]])
        cmd([[noh]]) -- Clean search :nohsearch
    elseif vim.bo.filetype ~= 'php' then
        print("This file isn't php type")
    elseif vim.wo.foldmethod ~= "manual" then
        print("The current foldmethod isn't manual")
    end
end
-- define on lua/core/maps.lua
-- map('n', '<leader>zs5', ':lua createFoldsL5Swager()<CR>', options)
