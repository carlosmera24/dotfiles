-- -----------------------------------------------------------------------------------------
-- Comandos y atajos de teclado personalizados
-- -----------------------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }
-- Tecla líder
map('n', '<Space>', '', {})
-- Guardar usando Leader+w
map('n', '<leader>w', ':w<CR>', options)
-- Salir usando Leader+q
map('n', '<leader>q', ':q<CR>', options)
-- Abrir terminal con Ctrl+t
map('n', '<c-t>', ':vertical<CR>:ter<CR>', options)
-- Siguiente archivo (:BNext) Shift+Tab
map('n', '<S-Tab>', ':bn<CR>', options)
-- Anterior Archivo (:BPrevious) Leader+Tab
map('n', '<leader><Tab>', ':bp<CR>', options)
-- Cerrar actuual Archivo (:BDelete) Leader+Backspace
map('n', '<leader><BS>', ':bd<CR>', options)
-- Abrir Explorador nativo con <Leader>
map('n', '<leader>E', ':Ex<CR>', options)
-- Set foldmethod indent
map('n', '<leader>fi', ':set foldmethod=indent<CR>', cmd_options)
-- Set foldmethod manual
map('n', '<leader>fm', ':set foldmethod=manual<CR>', cmd_options)
-- Collapse L5swager
map('n', '<leader>zs5', ':lua createFoldsL5Swager()<CR>', options)
-- Fold collapse all content
map('n', '<leader>fa', ':setlocal foldmethod=indent<CR>:setlocal foldmethod=manual<CR>', options)
-- Recargar vimrc
map('n', '<M-r>', ':source $MYVIMRC<CR>', options)
