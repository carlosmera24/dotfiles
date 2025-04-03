# TMUX

[tmux](https://github.com/tmux/tmux/wiki) es una terminal multiplexer, de esa manera permite tener en ejecución diferentes instancias dentro de una sola sesión, es decir, en cualqueir terminal del sistema se puede invocar el comando tmux para crear una nueva sessión y dentro de ella llamar o correr servicios en segundo plano y todo desde una sola sesión, de tal manera que se pueda navegar por los servicios adjuntos como sesiones, ventanas o paneles.

## Instalación

### Linux

En `ArchLinux` se puede instalar con pacman.

```shell
sudo pacman -S tmux
```

### MacOs

Instalar bajo `HomeBrew`

```shell
brew install tmux
```

Se pude verificar la versión con el comando `tmux -V`

## Funcionalidades

### Prefix Key

Por defecto, tmux tiene definido el comando `Ctrl+b`, de esta manera se interactua con los atajos de teclado de tmux, para esta documentación usaré la abreviación `prefixKey`. La lista de atajos de teclado o conbinaciones se pueden listar con `Ctrl+b+?`

### Sesiones

1. Iniciar nueva sesión
   
   ```shell
   tmux new -s nombre_sesion
   ```

2. Listar sesiones activas
   
   ```shell
   tmux ls
   ```

3. Conectar a una sesión existente
   
   ```shell
   tmux attach -t nombre_sesion
   ```

4. Desconectar sesión sin cerrarla: `prefixKey+d`, la sesión se cierra pero sigue abierta, se puede listar y unirse a ella.

5. Cerrar sesión:
   
   ```shell
   tmux kill-session -t nombre_sesion
   ```

### Ventanas

1. Crear nueva ventana: `prefixKey+c`

2. Cambiar entre ventanas:
   
   - Siguiente: `prefixKey+n`
   
   - Anterior: `prefixKey+p`
   
   - Ir a una ventana: `prefixKey+[numero]`

3. Cerrar ventana: Basta con salir de esa terminal (ventana) abierta usando el comando `exit` o `Ctrl+d`

### Paneles

1. Dividir paneles:
   
   - Verticalmente: `prefixKey+%`
   
   - Horizontalmente: `prefixKey+""`

2. Moverse entre paneles:
   
   - Siguiente: `prefixKey+o`
   
   - Anterior: `prefixKey+[flechas dirección]`

3. Redimensionar: `prefixKey+(Alt+[flechas dirección])`

4. Cerrar: `prefixKey+x` y confirmar

## Configuración

Tmux usa el archivo de configuración `~/.tmux.conf`, en este archivo se puede personalizar la configuarción

### Temas

Dado que `tmux` utiliza un archivo de configuración y no una carpeta específica, opto por definir un directorio para agregar extras y poder llamarlas de forma recursiva desde la configuración, esto me permite controlar con `stow` los directortio y su configuración, este directorio corresponde a `~/.config/tmux`, aquí defino el directorio `themes` para incluir los temas y llamar el correspondiente dentro de la configuración de `tmux`. Algunos temas probados son:

1. [catppuccin/tmux](https://github.com/catppuccin/tmux): `themes/catppucin`, variaciones `latte`, `frappe`, `macchiato` y `mocha`, definiciones:
   
   ```vim
   set -g @catppuccin_flavor 'mocha'
   set -g @catppuccin_window_status_style "rounded"
   
   run ~/.config/tmux/themes/catppuccin/catppuccin.tmux
   
   set -g status-right-length 100
   set -g status-left-length 100
   set -g status-left ""
   set -g status-right "#{E:@catppuccin_status_application}"
   set -ag status-right "#{E:@catppuccin_status_session}"
   set -ag status-right "#{E:@catppuccin_status_uptime}"
   
   ```
2. [tmux-themepack](https://github.com/jimeh/tmux-themepack): `themes/themepack` variaciones:
   - `set -g @themepack 'basic'` (default)
   
   - `set -g @themepack 'powerline/block/blue'`
   
   - `set -g @themepack 'powerline/block/cyan'`
   
   - `set -g @themepack 'powerline/default/green'`:
   
   - `set -g @themepack 'powerline/double/magenta'`
     
     > los colores pueden variar a: blue, cyan gray, green, magenta, orange, purple, red, yellow

> 
> TODO Agregar tema
