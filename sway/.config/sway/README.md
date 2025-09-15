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
sudo pacman -S sway waybar gtklock swayidle swaybg wofi foot networkmanager network-manager-applet wofi archlinux-wallpaper elementary-icon-theme orchis-theme mako wl-clipboard grim wf-recorder slurp ttf-font-awesome xdg-desktop-portal xdg-desktop-portal-wlr pipewire wireplumber pipewire-pulse gst-plugin-pipewire playerctl brightnessctl v4l2loopback-dkm adapta-nokto-gtk-theme gnome-keyring
```

```shell
yay -S wlogout numix-icon-theme-circle
```

```shell
paru -S wlogout numix-icon-theme-circle
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

Para el tema he utilizado en el directorio de configuración `~/.config/wofi` el archivo `style.css` desde catppuccin moha, al ejecutarlo toma por defecto este archivo.

### Teclado

La documentación sugiere listar los inputs con el comando `swaymsg -t get_inputs` y de esta manera poder determinar o identificar el teclado a partir de su identificador o tipo, siendo práctico usar el tipo, dado que no necesitamos en si conocer el identificador, para definir la distribución del teclado basta agregar:

```vim
input "type:keyboard" {
    xkb_layout es
}
```

Como vemos, definimos `type:keyboard` de una manera global y simple.

#### Teclas multimedia

Si el teclado acepta y se reconoce las teclas multimedias, he habilitado el uso de las teclas para pausar, reproducir, siguiente, anterior y stop de la reproducción en curso, par esto dememos tener instalado `playerctl`:

```shell
sudo pacman -S playerctl
```

Es posible validar las teclas del teclado instalando `evtest` y ejecutar `sudo evtest` seleccionando el teclado, de esta manera podemos ver las teclas que acepta.

#### Brillo de pantalla (brightnessctl)

Se requiere el programa `brightnessctl`:

```shell
sudo pacman -S brightnessctl
```

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

Tal y como sugiere la documentación de `sway` de ArchLinux, el paquete a instalar para bloquear la pantalla es  [swaylock](https://github.com/swaywm/swaylock), partimos de su instalación con pacman, tras su instalación se puede ejecutar `swaylock` y se bloqueará la pantalla, para desbloquear es necesarios ingresar la contraseña del usuario actual. En cuanto a su estilo y configuración no posee una ruta como tal, es necesario indicar en la ejecución la ruta correspondiente, para ello creo `~/.config/swaylock/` en donde registro los archivos de configuración y el script que se encargará de ejecutar `swaylock` con la personalización:

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

## Capturas de pantalla

La documentación de ArchLinux para [Wayland](https://wiki.archlinux.org/title/Screen_capture#Wayland), sobre la captura de pantalla, sugiere los paquetes [grim](https://archlinux.org/packages/?name=grim) para capturar pantalla, [wf-recorder](https://archlinux.org/packages/?name=wf-recorder) para grabar la pantalla,  [wlrobs-hg](https://aur.archlinux.org/packages/wlrobs-hg/)(AUR) como complemento de wlroots-based para obs-studio, y [slurp](https://archlinux.org/packages/?name=slurp) para seleccionar la región de la pantalla a capturar. Partimos de instalar:

```shell
sudo pacman -S grim wf-recorder slurp
```

### Capturar región y copiar al portapapeles

Para este caso, grim hace una captura de pantall a partir de la región que definamos con el comando `grim -g "$(slurp)"` ([Simon Ser / grim · GitLab](https://gitlab.freedesktop.org/emersion/grim)), posteriormente se copia al portapapeles con `wl-copy` (perteneciente al paquete wl-clipboard), el comando completo:

```shell
grim -g "$(slurp)" - | wl-copy --type image/png
```

Este comando lo he agregado como atajo de teclado a la configuración de `sway` como `Ctrl+Shift+Imp pnt` y `Super+Ctrl+Shift+4`

## Notificaciones

La pagina de ArchLinux para [Desktop notifications](https://wiki.archlinux.org/title/Desktop_notifications) aclara que se usa `libnotify` para el envío o ejecución de la notificación, esta herramienta tiene soporte para aplicaciones GTK/Qt, ahora bien, también necesita un servidor de notificaciones, en este caso, para Wayland, se sugiere usar [mako](https://github.com/emersion/mako).

### Mako

Estos paquetes pueden ser instalados desde pacman, basta con agregar la ejecución de mako al inicio de sway desde su archivo de configuración. El directorio de configuración de mako es `~/.config/mako/` el cual esta manejado con stow.

## Display Manager

Como gestores de inicio de sesión he utilizado tanto `lightDM` y `GDM`, ambos reconocen y trabajan con sway sin problemas.

### GDM

Es necesario verificar que el archivo `/etc/gdm/custom.conf` no tenga `WaylandEnable` como false, si es así, no se visualizará las opciones que involucren a wayland y por ende, tampoco sway

## Captura/compartir pantalla - Navegadores

He experimentado en Brave, durante una reunión en Google Meet, que no me era posible compartir ventanas o aplicaciones, solo me dejaba compartir pestañas, indagando, esto es un comportamiento para los navegadores que requieren unos permisos adicionales, en mi caso, basto con instalar:

```shell
sudo pacman -S xdg-desktop-portal-wlr
```

>Es importante saber que Wayland tiene un soporte limitado para compartir la pantalla, permitiendo compartir pestañas o toda la pantalla (escritorio o monitor), pero para compartir una aplicación en particular es necesario ejecutar en modo X11 el navegador o aplicación:
>
>```shell
>XDG_SESSION_TYPE=x11 brave & disown 
>```

Reinicié mi sesión y me dejó compartir, sin problemas, aplicaciones o ventanas. Ahora bien, es importante validar que se cuente con el soporte de PipeWire y xdk-desktop-portal, esto si no funciona como se espera:

1. Paquetes necesarios

```shell
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-wlr pipewire wireplumber pipewire-pulse gst-plugin-pipewire
```

2. Verificar servicios corriendo para el usuario:

```shell
systemctl --user status pipewire
systemctl --user status xdg-desktop-portal
```

## Gestión de contraseñas

Por si solo, hyperlad no tiene un gestor de contraseñas, sin embargo, hay algunas herramientas que lo hacen, tales como `gnome-keyring` y `kwalletmanager`. Por esta razón, aplicaciones que requieran guardar/almacenar contraseñas generaran errores si no tiene cómo registrarlos, tal es el caso de `mysql-workbench` que genera un error referente a `The name is not activable`, o los navegadores de internet.

### gonme-keyring

Es funcional y está pensado para uso de `gnome` o `cinnamon`, basta con instalar:

```shell
sudo pacman -S gnome-keyring
```

Se integra muy bien con gestores de inicio de sesión como `lightdm` o `gdm`, permitiendo que se inicie automáticamente el servicio al inicio de sesión y no solicitar contraseña para activar la gestión de las contraseñas al abrir cualquier programa que lo requiera.

### pass y pass-secret-service

Esta opción es la mejor y la recomendada para usar sistemas livianos como es el caso de `sway`, de esta manera no dependemos de aplicaciones complejas, además no requiere que tenga integración con gestores de inicio de sesión, como es el caso de `nwg-hello`, el cual no se integra con ningún gestor de contraseñas (gnome-keyring, kwallet). Para su instalación debemos seguir unos pasos:

1. Instalar `pass` y `pass-secret-service`, este último lo encontramos en AUR

```shell
sudo pacman -S pass 
paru -S pass-secret-service
```

> Esto requiere tener desinstalado `gnome-keyring` ya que entra en conflicto con `pass-secret-service`, adicionalmente es importante limpiar servicios que apunten a gnome-keyring:
>
>```shell
>systemctl --user mask gnome-keyring-daemon.service
>systemctl --user mask gnome-keyring-daemon.socket
>systemctl --user mask gnome-keyring-daemon.target
>```

2. Confgurar `gpg` para almacenar las contraseñas

```shell
gpg --full-generate-key
```

> seguir el asistente, normalmente RSA/4096, expiración no

listar gpg --list-keys y tomar nota del ID para iniciar `pass` con ese ID:

```shell
pass init ABC12345
```

> Esto creará el directorio `~/.password-store` donde se almacenarán las contraseñas.

3. Iniciar el servicio de `pass-secret-service`, para esto basta con ejecutar `pass-secret-service -d &`, lo agregamos a la configuración de sway como:

```vim
exec --no-startup-id pass-secret-service -d
```

4. Pruebas:

- Verificar DBus expuesto:

```shell
busctl --user list | grep org.freedesktop.secrets
```
> Se debería ver la salida `org.freedesktop.secrets` (activable), cuando se ejecute una aplicación que use el servicio deberá aparecer `pass-secret-ser`

- Agregar contraseñas:

```shell
secret-tool store --label='Prueba' test key
```
>te pedirá escribir un valor

```shell
secret-tool lookup test key
```
> debería devolverte el valor

5. Al reiniciar el sistema debería funcionar sin problemas, se puede probar aplicaciones que requieren el uso del gestor de contraseñas y debería acceder sin pedir autenticación.

## Gestor de inicio de sesión o login

He probaado tanto `lightDM` como `GDM`, ambos reconocen y trabajan con sway sin problemas. Sin embargo, he optado por usar un gestor optimizado para `Wayland`, tal es el caso de [nwg-hello](https://github.com/nwg-piotr/nwg-hello) que hace parte del proyecto [nwg-shell](https://nwg-piotr.github.io/nwg-shell) que tiene varias aplicaciones que optimizadas para `Wayland`,las cuales estàn basadas en GTK3-based, lo que lo hace muy liviano; en `ArchLinux` hace parte de `nwg-shell`.

### Instalar nwg-hello

1. Instalar nwg-hello:

```shell
sudo pacman -S nwg-hello
```

2. Editar la configuración de `greetd` en `~/.config/greetd/greetd.toml`, modificando la linea `command` por:

```toml
command = "sway -c /etc/nwg-hello/sway-config"
```

3. Iniciar el servicio de `greetd`:

```shell
sudo systemctl enable  greetd
```
> Previamente se debe deshabilitar `lightDM` o `GDM` con `systemctl disable lightdm.service` o `systemctl disable gdm.service`
