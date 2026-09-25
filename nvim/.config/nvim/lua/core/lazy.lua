-- Lazy instalación, path ~/.local/share/nvim/lazy/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- preparación de lazy y su configuración
-- Los plugins se define y configurar en lua/core/plugins-settings
if vim.loop.fs_stat(lazypath) then
    vim.g.mapleader = ' '  -- 'vim.g' sets global variables requerido por lazy
    require("lazy").setup("core.plugins",{
        -- Prevent `build failed` on Avante.vim
        -- Else it will be necessary run:
        -- `cd ~/.local/share/nvim/lazy/avante.nvim && make`
        git = {
            timeout = 600, -- increase the limit to 600 seconds (10 minutes)
        },
    })
end
