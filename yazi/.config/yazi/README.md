# YAZI

[Yazi](https://yazi-rs.github.io/) es un rápido gestor de archivos para terminal, ejecutando el comando `yazi` desde la terminal, podremos visualizar un gestor de archivos al estilo de Neovim, el cual nos permite gestionarlos, así como previsualizarlos o abrirlos.

## Instalación

### Linux

Está disponible en la mayoría de las distribuciones, en `ArchLinux` podemos instalarlo desde pacman:

```shell
sudo pacman -S yazi
```

> Instalar con todas las dependencias sugeridas:
> 
> ```shell
> sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick
> ```

### MacOs

A través de `Homebrew`:

```shell
brew install yazi
```

> Instalar con las dependencias sugeridas:
> 
> ```shell
> brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick
> ```

## Dependencias

La [pagina oficial](https://yazi-rs.github.io/docs/installation) sugiere y lista las dependencias que deberíamos utiliar, la mayoría de ellas las he instalado por el uso de Neovim:

- [file](https://github.com/file/file)

- [nerd-fonts](https://www.nerdfonts.com/) ([*recommended*](https://yazi-rs.github.io/docs/faq#dont-like-nerd-fonts))

- [ffmpeg](https://www.ffmpeg.org/)

- [7-Zip](https://www.7-zip.org/) (for archive extraction and preview)

- [jq](https://jqlang.github.io/jq/) (for JSON preview)

- [poppler](https://poppler.freedesktop.org/) (for PDF preview)

- [fd](https://github.com/sharkdp/fd) (for file searching)

- [rg](https://github.com/BurntSushi/ripgrep) (for file content searching)

- [fzf](https://github.com/junegunn/fzf) (for quick file subtree navigation)

- [zoxide](https://github.com/ajeetdsouza/zoxide) (for historical directories navigation)

- [ImageMagick](https://imagemagick.org/) (for SVG, Font, HEIC, and JPEG XL preview)

- [xclip](https://github.com/astrand/xclip) / [wl-clipboard](https://github.com/bugaevc/wl-clipboard) / [xse`](https://github.com/kfish/xsel) (for Linux clipboard support)

## Comandos (Keybindings)

Aconstumbrarse a los atajos o combinación de teclas es supremamente fácil, ya que al estar familiarizado con `Vim` se facilita, se pueden consultar en la [pagina](https://yazi-rs.github.io/docs/quick-start#keybindings) o directamente desde la instancia de `yazi`usando `F1` o `~`.

## Configuración

Yazi usa el directorio `~/.config/yazi`, en dónde se usan los archivos:

- [`yazi.toml`](https://yazi-rs.github.io/docs/configuration/yazi) - Configuración general.

- [`keymap.toml`](https://yazi-rs.github.io/docs/configuration/keymap) - Atajos de teclado.

- [`theme.toml`](https://yazi-rs.github.io/docs/configuration/theme) - Esquema de colores, se pueden validar [temas](https://github.com/yazi-rs/flavors) existentes.

### Temas

Para el manejo de temas estoy clonando el repositorio (Importante limpiar .git para que no quede como submodulo) y lo guardo en la ruta `~/.config/yazi/flavors/`, luego se define el tema en el archivo `theme.toml`:

```vim
[flavor]
use = "tokyo-night"
```

Los directorios del tema deben ser guardado con `.yazi` al final, por ejemplo `flavors/dracula.yazi/`. En los temas disponibles tengo:

- [dracula.yazi](https://github.com/yazi-rs/flavors/blob/main/dracula.yazi)

- [catppuccin-mocha.yazi](https://github.com/yazi-rs/flavors/blob/main/catppuccin-mocha.yazi)

- [catppuccin-frappe.yazi](https://github.com/yazi-rs/flavors/blob/main/catppuccin-frappe.yazi)

- [catppuccin-macchiato.yazi](https://github.com/yazi-rs/flavors/blob/main/catppuccin-macchiato.yazi)

## Editor de texto

Por defecto `yazi` intenta usar la variable de entorno `$EDITOR`, si queremos definir el editor de preferencia, en mi caso `Neovim`, es necesario editar `~/.bashrc` o `~/.zsrch` agregando:

```vim
export EDITOR=nvim
```

Y recarcar con `source ~/.bashrc` o `source ~/.zsrc`
