local opt = vim.opt
local cmd = vim.cmd

opt.syntax = "on"
opt.termguicolors = true  --Activa true colors en la terminal
opt.background = "dark"  --Fondo del tema: light o dark
opt.number = true --Numero de líenas
opt.title = true --Muestra el nombre del archivo en la ventana del terminal
opt.mouse = 'a' --Habilita la integración del mouse para selección o mover
opt.wrap = false --No divide la line si el texto es muy grande
opt.cursorline = true --Resalta la linea actual
opt.colorcolumn = "120" --Muestra la columna límite a 120 caracteres
--Color de la columna limite de escritura
cmd 'highlight ColorColumn ctermbg=0 guibg=lightgrey'
opt.sw = 2 --Identación más pequeña
opt.smartindent = true --Al saltar tabula automaticamente en código
opt.rnu = true --Numero de líenas relativas, indica a partir de la línea numero hacia arriba y abajo
opt.numberwidth = 1 --Tamaño del numero de líneas
opt.swapfile = false --Evitar errores con algunos archivos referentes al archivo swap
opt.backup = false --Sin copia de seguridad

-- Indentación a 4 espacios, ya que es la más usada
-- preferiblemete me gusta a 2 espacios
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true
opt.expandtab = true --Insertar espacios en lugar de <Tab>s

opt.hidden = true --Permitir cambiar de buffers sin tener que guardarlos
opt.ignorecase = true --Ignorar mayúsculas al hacer una búsqueda
opt.smartcase  = true --No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
opt.clipboard = "unnamedplus" --Integrar la copia con el portapapeles, alternativo unnamed
opt.encoding = "UTF-8" --Permitir caracteres especiales
opt.spelllang = "en,es"  --Corregir palabras usando diccionarios en inglés y español

-- Solucionar problemas con la sintaxis en arvhivos grandes
opt.redrawtime = 10000
cmd 'syntax sync fromstart'
opt.re = 1

-- Avante
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- folding
require("core.settings.folding")
