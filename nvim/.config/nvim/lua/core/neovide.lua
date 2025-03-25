if vim.g.neovide then
    -- Font -> Adicional configuración en ~/.config/neovide/config.toml, tales como fuentes adicionales en estilos.
    -- Mi configuración usada es:
    -- [font]
    --     normal = ["Fira Code Medium"]
    --     size = 12
    --     bold = ["Cascadia Code"]
    --     italic = ["Cascadia Code"]
    --     bold_italic = ["Cascadia Code"]
    vim.o.guifont = "Fira Code Medium:h12"
end
