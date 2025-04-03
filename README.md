# DOTFILES CON STOW

Depués de usar de manera independiente mi configuración de las diferentes herramientas que uso en mis entornos de desarrollo Linux/MacOs, las cuales están versionadas con Git, he optado por usar [GNU Stow](https://www.gnu.org/software/stow/), esta herramienta permite gestionar los archivos dotfiles en un solo directorio y generar enlaces simbólicos a las rutas de configuración, de esa manera es posible gestionar todas las configuraciones desde un único lugar.

## Stow

Para su instalación en `ArchLinux` basta ejecutar:

```shell
sudo pacman -S stow
```

En `MacOs` se puede instalar con **Homebrew**:

```shell
brew install stow
```

> Los comandos a utilizar para desplegar los directorios está más adelante.

## Directorio de configuración

Mi configuración está en el directorio `~/.dotfiles`, el cual está versionado con Git en diferentes repositorios. En este directorio se agrega cada una de las herramientas a gestionar por directorio, este último tendrá la ruta de configuración final, tal y cómo se debe crear el enlace simbólico, por ejemplo `kitty`, su directorio de configuración final deberá ser `~/.config/kitty`, entonces la ruta que deberá tener en dotfiles será: `.dotfiles/kitty/.confg/kitty/`, de esta manera, cuando se ejecute el comando correspondiente de `stow`, por ejemplo `stow kitty` generará el enlace simbólico en `~/.config/kitty`.

## Herramientas/Applicaciones gestionadas

A continuación describo las herramientas o aplicaciones que estoy gestionando con stow indicando el directorio raíz y el directorio final de confguración a desplegar como enlace simbólico:

| Herramienta | Raíz      | Ruta completa                             | Directorio final      |
| ----------- | --------- | ----------------------------------------- | --------------------- |
| Kitty       | kitty     | `~/.dotfiles/kitty/.config/kitty`         | `~/.config/kitty`     |
| Alacritty   | alacritty | `~/.dotfiles/alacritty/.config/alacritty` | `~/.config/alacritty` |
| WezTerm     | wezterm   | `~/.dotfiles/wezterm/.config/wezterm`     | `~/.config/wezterm`   |
| NeoVim      | nvim      | `~/.dotfiles/nvim/.config/nvim`           | `~/.config/nvim`      |
| Sway        | sway      | `~/.dotfiles/sway/.config/sway`           | `~/.config/sway`      |
| Swaylock    | swaylock  | `~/.dotfiles/swaylock/.config/swaylock`   | `~/.config/swaylock`  |
| Waybar      | waybar    | `~/.dotfiles/waybar/.config/waybar`       | `~/.config/waybar`    |
| tmux        | tmux      | `~/.dotfiles/tmux/.tmux`                  | `~/.tmux`             |

## Árbol de directorio

Para el directorio principal `.dotfiles` tenemos:

```shell
tree -La 3
.
├── README.md
├── alacritty
│   └── .config
│       └── alacritty
├── kitty
│   └── .config
│       └── kitty
├── nvim
│   └── .config
│       └── nvim
├── sway
│   └── .config
│       └── sway
├── swaylock
│   └── .config
│       └── swaylock
├── tmux
│   ├── .config
│   │   └── tmux
│   ├── README.md
│   └── .tmux.config
├── waybar
│   └── .config
│       └── waybar
└── wezterm
    └── .config
        └── wezterm
```

## Stow

### Desplegar

Después de tener todo configurado, para desplegar la configuración la podemos realizar de varias formas ubicandonos en el directorio correspondiente a `.dotfiles`:

1. De manera individual:
   
   ```shell
   cd ~/.dotfiles
   stow alacritty
   ```

2. Agrupando todas en un solo comando:
   
   ```shell
   cd ~/.dotfiles
   stow alacritty kitty nvim wezterm
   ```

3. Ejecutando todo de manera automática:
   
   ```shell
   cd ~/.dotfiles
   stow .
   ```
   
   > Importante tener todo configurado por directorios de la manera correcta y ser consientes que se aplicará todos los directorios 

### Verificar

Dado que `stow`genera enlaces simbólicos para los directorios, podemos verificar su creación, por ejemplo, para el directorio `.conf`:

```shell
ls -la ~/.conf
```

Los directorio simbólicos se listarán de esta manera:

```shell
alacritty -> ../.dotfiles/alacritty/.config/alacritty
kitty -> ../.dotfiles/kitty/.config/kitty
nvim -> ../.dotfiles/nvim/.config/nvim
wezterm -> ../.dotfiles/wezterm/.config/wezterm
```

### Definir ruta final

Si no se debe aplicar el directorio por defecto, es decir, la estructura que se ha definido para cada aplicación en stow, debemos indicarle manualmente la ruta en la que debe ser procesada para ello dicha ruta debe existir y ejecutar el comando stow con `-t`, por ejemplo:

```shell
stow -t ~/Library/Application\ Support kitty
```

Esto creará el directorio kitty en `~/Library/Application Support/`

### Ignorar ficheros/carpetas

Si queremos que `stow` ignore ciertos archivos al momento de crear los enlaces simbólicos, es necesario crear el archivo `.stow-local-ignore` en la raíz del directorio principal (.dotfiles) y agregar po líenas los archivos que queremos ignorar, por ejemplo:

```vim
.git
README.md
```

### Retirar aplicación

Para desvincular o eliminar los dotsfiles de una aplicación en concreta, basta con ejecutar stow desde el directorio `.dotfiles`:

```shell
stow alacritty -D
```

Si la aplicación tiene un directorio especial definido como target:

```shell
stow alacritty -D -t ~/Library/Application\ Support
```
