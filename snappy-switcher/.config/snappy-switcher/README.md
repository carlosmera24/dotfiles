# Snappy Switcher

[Snappy Switcher](https://github.com/OpalAayan/snappy-switcher) Es un programa para cambiar rápidamente entre ventanas y aplicaciones en Hyprland, con un estilo minimalista y un diseño moderno, a través de `ALT+TAB`

## Instalación:

Para la instalación en `Arch Linux`, es necesario recurrir al repositorio de `AUR`:

```bash
paru -S snappy-switcher
```

## Configuración rápida

> Para la instalación por primera vez

1. Replicar la configuración al directorio personal:

```bash
snappy-install-config
```

Esto copiará en el directorio `~/.config/snappy-switcher` el archivo de configuración `config.ini` y la carpeta de `themes` desde el directorio `/etc/xdg/snappy-switcher/`.

2. Agregar configuración a `Hyprland` en `.config/hypr/hyprland.lua`:

```lua
-- Start daemon on login
hl.exec_cmd("snappy-switcher --daemon")

-- Alt+Tab (standard MRU)
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"))

-- Super+Tab (workspace-filtered)
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("snappy-switcher next --workspace --mod super"))
```

## Temas

Hay 15 temenas, entre ellos Catppuccin (Mocha/Latte/Frappe), Dracula, Nord, Nordic, Tokyo Night, Gruvbox, Rose Pine, Cyberpunk, Liquid Glass, y más.

Para cambiarlo:
1. Copiar el archivo en el directorio `~/.config/snappy-switcher/themes/`

2. Definirlo en el archivo de `config.ini`:

```ini
[theme]
name = catppuccin-mocha.ini
```
