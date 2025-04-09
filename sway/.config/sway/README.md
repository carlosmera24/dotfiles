# Sway

Es un **Tilling** compositor para wayland y funciona muy bien en entornos **X11**, lo que lo convierte en una alternativa a Hyprland en equipos con tarjetas gráficas más complejas o antiguas como nvidia. Compatible con `i3`, por lo que se puede copiar su configuración. En la pagina oficial de [ArchLinux-Sway](https://wiki.archlinux.org/title/Sway) encontradmos la descripción, instalación y otras indicaciones a considerar.

## Instalación

Su instalación en ArchLinux es muy sencilla, basta con ejecutar:

```shell
sudo pacman -S sway 
```

Instalará un par de dependencias y estamos listos para ejecutarla, lo cual se puede hacer desde la terminal TTY o con el display manager, como lightdm. Antes de ejecutarlo, debemos tener presente que no tenemos una configuración y que algunas opciones pueden no estar disponibles, como lo es la apertura de la terminal, la cual está con el atajo `Super+Enter`, dado que usa la terminal `foot`, si no la tenemos instalada no abrirá, para ello es importante preparar la configuración básica antes de comenzar. En la pagina de `ArchLinux` nos sugieren instalar algunos paquetes a considerar y que describo en detalle en cada apartado de la configuración, `swaylock`, `swayidle`, `sawybg`, `wmenu` y `foot`, estos para bloquear la pantalla, configurar un idle manager, establecer fondos de pantalla, lazar aplicaciones y tener la terminal por defecto, respectivamente.

### Instalación recomendada 

Mi instalación recomendada o en un solo comando, después de recopilar toda mi configuración y dependencias:

```shell
sudo pacman -S sway gtklock swayidle swaybg wofi foot networkmanager network-manager-applet wofi archlinux-wallpaper elementary-icon-theme orchis-theme wl-clipboard 
```

```shell
yay -S wlogout
```

## Configuración

La ruta de configuración será `~/.config/sway/conf`, inicialmente tomará la configuración del sistema por lo que es oportuno copiarla como base desde `/etc/sway/config`:

```shell
 cp /etc/sway/config /home/carlos/.config/sway/
```

La modificaciión del archivo requiere recargar la configuración con el atajo `Super+Shift+c`

### Definir terminal de preferencia

En la configuración encontramos la definición de la terminal bajo la variable `$term` y está establecida como [Foot](https://wiki.archlinux.org/title/Foot), una terminal rápida, liviana y minimalista para wayland, para ello definimos o sobreescribimos:

```vim
set $term kitty
```

De esa manera podremos ejecutar el atajo `Super+Enter`

### Ejecutar/Buscar aplicaciones

En este caso podemos usar la aplicación de preferencia, por defecto usa [wmenu](https://codeberg.org/adnano/wmenu) un lanzador de aplicaciones minimalista y liviando, teniendo otras recomandaciones como rofi,  dado que `wofi` es el más común y usado por hyprland partimos de tener la instlación:

```shell
sudo pacman -S wofi
```

Y definimos la variable `$menu`:

```vim
set $menu wofi --show drun
```

Asì podremos usar el atajo `Super+d`, sin embargo he agregado el atajo `Alt+F2`.

### Teclado

La documentación sugiere listar los inputs con el comando `swaymsg -t get_inputs` y de esta manera poder determinar o identificar el teclado a partir de su identificador o tipo, siendo práctico usar el tipo, dado que no necesitamos en si conocer el identificador, para definir la distribución del teclado basta agregar:

```vim
input "type:keyboard" {
    xkb_layout es
}
```

Como vemos, definimos `type:keyboard` de una manera global y simple.

### Touchpad

Todos los imputs los podemos identificar como mencioné en el punto anterior, y de igual manera, podemos usar la definición global para el touchpad:

```vim
input "type:touchpad" {
    dwt enabled
    tap enabled
    natural_scroll enabled
    middle_emulation enabled
    #Gestos, 1 dedo click, 2 dedos click derecho
    tap_button_map lrm
}        
```

> Podemos usar `"type:touchpad"` o bien sin comillas `type:touchpad` 

### Cursor tema

Teniendo instalado el icono de nuestra preferencia, por ejemplo `Adwaita` o `elementary`, pasamos a definir en la configuración:

```shell
seat seat0 xcursor_theme elementary 16
```

Done `elementary` es el pack de iconos y `16` es el tamaño que usará.         

### Explorador de archivos

Podemos usar el que más nos guste, en mi caso usaré nemo, para ello defino una variable `$fileManager` y agregar su atajo de teclado:

```vim
set $fileManager nemo
bindsym $mod+e exec $fileManager
```

El atajo `Super+e` abre el explorador de archivos, he tenido que reemplazar ese atajo que por defecto está definido para intercambiar entre split vertical u horizontal, quedando como `Super+Alt+E`

```vim
bindsym $mod+Mod1+e layout toggle split
```

### Fondo de pantalla

Sway maneja la visualizción del fondo de pantalla con un programa dedicado, para ello recomienda utilizar [swaybg](https://github.com/swaywm/swaybg) y lo podemos instalar desde pacman, una vez instalado y, teniendo la ruta del fondo de pantalla, en este caso usaré `/usr/share/backgrounds/`, pasamos a definir el fondo de pantalla en la configuración:

```vim
output * bg /usr/share/backgrounds/archlinux/awesome.png fill
```

Una vez reiniciada o recargada la configuración se visualizará el fondo de pantalla en todos los escritorios.

### Barra de estado

Por defecto Sway usa `sway-bar` el cual viene incluido en su instalación, la documentaciòn de AchLinux sugier instalar `i3status`o [waybar](https://github.com/Alexays/Waybar/), siendo está una de las opciones más recomendada por su amplia personalización, incluso Hyprland la usa por defecto. La configuración base incluye la configuación inicial:

```vim
bar {
    position top

    # When the status_command prints a new line to stdout, swaybar updates.
    # The default just shows the current date and time.
    status_command while date +'%Y-%m-%d %X'; do sleep 1; done

    colors {
        statusline #ffffff
        background #323232
        inactive_workspace #32323200 #32323200 #5c5c5c
    }
}
```

#### i3status

Si optamos por usar `i3status` debemos reempalzar `status_command' por:

```vim
bar {
    position top
    status_command i3status
    colors {
        statusline #ffffff
        background #323232
        inactive_workspace #32323200 #32323200 #5c5c5c
    }
}
```

La configuración de `i3status` está ubicada en `~/.config/i3status/config`, podemos copiar la configuración base desde `/etc/i3status.conf`.

#### Waybar

Usada por Hyprland, es muy configurable, encontramos la documentación en su [repositorio oficial](https://github.com/Alexays/Waybar?tab=readme-ov-file), incluso tenemos un apartado de [ejemplos](https://github.com/Alexays/Waybar/wiki/Examples) donde podemos tener diseños definidos a partir de dotfiles. Antes de que nada, debemos instalarla desde pacman junto a la fuente `otf-font-awesome`, posteriormente  debemos incluir el llamado en la configuración, eliminado o comentando la definición de `bar`, si no hacemos esto último nos visualizará sway-bar:

```vim
bar swaybar_command waybar
# bar {
# ....
```

También se puede usar `exec waybar`. Al reiniciar la configuraión visualizaremos la barra superior, la cuál es más agradable que i3status. La configuración de waybar es independiente y se ubica en `~/.config/waybar/` aunque acepta otras ubicaciones, la configuración está en formato `JSONC`, podemos descargar la base desde el repositorio de [GitHub](https://github.com/Alexays/Waybar/tree/master/resources) o copiarlo desde la instalación local:

```shell
mkdir ~/.config/waybar/
cp /etc/xdg/waybar/config.jsonc ~/.config/waybar/
cp /etc/xdg/waybar/style.css ~/.config/waybar/
```

##### Estilos de la comunidad

En los estilos encontrados dentro de la comunidad, en especial los ejemplos que provee el repositorio de waybar, estoy usando:

1. [Egosummiki](https://github.com/Egosummiki/dotfiles/tree/master/waybar) simplemente se descargan los 3 archivos que provee el usuario config, style y mediaplayer.sh

2. 

##### Menú logout

###### Wlogout

`wlogout` es un menú logout para wayland, se puede instalar desde `AUR`, tiene un mejor aspecto gráfico y se puede personalizar. Partimos de tenerlo instalado y crear la copia de los archivos de configuración `/etc/wlogout/` a `~/.config/wlogout/`, dentro de la configuración, he cambiado en `layout` la acción para bloquear la pantalla con `gtklock` y el tema con 

###### Personalizado - wofi

He creado mi propio script como `power-menu.sh` y le he concedido los permisos de ejcución `sudo chmod +x power-menu.sh`, este script se ejecuta con `wofi` por lo que es importante tenerlo previamente instalado;editando el archivo de configuración de waybar he agregado:

```json
{
    "modules-right": [ ... , "custom/power" ]
    ----- 
        "custom/power": {
        "format": "⏻ ",
        "tooltip": false,
        "on-click": "~/.config/waybar/power-menu.sh"
        // "on-click": "sh -c '~/.config/waybar/power-menu.sh'"
    }
}
```

De esta manera tengo una forma sencilla y funcional para cerrar sesión o apagar el sistema, de igual manera puedo usar atajo `Super+Shift+E` para cerrar `Sway`. Importante destacar que para el bloqueo de pantalla he definido en el script el uso de `swaylock`, más adelante amplío su documentación.    

### Bloqueo de pantalla

La documentación de [ArchLinux - Session lock](https://wiki.archlinux.org/title/Session_lock#Wayland) sugiere algunas aplicaciones que podemos usar, para el caso de `sway` debemos usar los recomendados para `Wayland`, gráficamente me ha gustado `gtklock` el cual incluye componentes definidos por defecto, siendo `saylock` y `waylock` lo màs sencillos.

#### Gtklock

El paquete instalable desde Pacman es `gtklock`, he agregado el atajo de teclado `Ctrl+Alt+L` para ejecutar el bloqueo de pantalla. En cuanto a la configuración toma por defecto `~/.config/gtklock/config.ini`

#### Swaylock

Tal y como sugiere la documentación de `sway` de ArchLinux, el paquete a instalar para bloquear la pantalla es  [swaylock](https://github.com/swaywm/swaylock), partimos de su instalación con pacman, tras su instalación se puede ejecutar `swaylock` y se bloqueará la pantalla, para desbloquear es necesarios ingresar la contraseña del usuario actual. En cuanto a su estilo y configuración no posee una ruta como tal, es necesario indicar en la ejecución la ruta correspondiente, para ello creo `~/.config/swaylock/` en donde registro los archivos de configuración y el script que se encargará de ejecutar `swaylock` con la personalización:

```vim
config.confi
swaylock.sh
```

 `swaylock.sh` debe tener permisos de ejecución, ya que debemos modificar la configuración de `waybar` o cualquier otro, para que ejecute el script `swaylock.sh` en lugar del comando `sway` como tal, de esa manera podremos personalizar a gusto. Para la personalización en la web podemos encontrar muchos dotfiles para personalizar, entre ellos tenemos [catppuchin-swaylock](https://github.com/catppuccin/swaylock), para lo cual basta descargar los archivos y ubicarlos en el directorio de configuración, reemplazando el archivo config y ajustado lo que se requiera. He agrado el comando `Ctrl+Alt+L` para ejecutar el bloqueo de pantalla. Ahora bien, tenemos un bloqueo que pantalla sencillo y funcional, existe otra alternativa extendida que es `swaylock-effects` instalable desde `aur`, por ahora decido quedarme con `swaylock`.

### Gestión de sesiones inactivas

Sway tiene un demonio de gestión de sesiones inactivas llamado `swayidle` para gestionar las sesiones inactivas, instalable desde pacman, basta con agregar a la configuración de sway:

```vim
exec swayidle -w \
         timeout 300 'gtklock' \
         timeout 600 'swaymsg "output * power off"' \
         resume 'swaymsg "output * power on"' \
         before-sleep 'gtklock'
```

> Esto bloqueará la pantalla en 5 minutos, 10 minutos después apagará la pantalla y al regresar la pantalla se encenderá. 

### Conexiones de red

Para su gestión uso `NetworkManager` el cual debe estar instalado y habilitado para su inicio automático en el inicio del sistema 

```shell
sudo pacman -S networkmanager
sudo systemctl enable --now NetworkManager
```

Para la gestión de las conexiones gráficamente, uso `nm-applet` instalable desde Pacman:

```shell
sudo pacman -S network-manager-applet
```

Esto proporcion el ejecutable para tener un icono en waybar y gestionar las conexiones de manera gráfica, para ello he agregado a la configuración de sway el inicio automático:

```vim
exec nm-applet
```

> Adicionalmente, he eliminado el llamado de el icono de identificación de la red conectada de waybar, ya que `nm-applet` lo muestra por defecto.

## Clipboard

Para una mayor compatibilidad con waylan, es sugerible instalar wl-clipboard, es posible tener xclipboard, pero no trabajará correctamente con la copia en Neovim, por esa razón es importante instalar wl-clipboard, de esa manera aseguramos que al copiar en Neovim este disponible para todo el sistema
