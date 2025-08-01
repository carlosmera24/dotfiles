# Hyprland

Es un **Tilling** compositor para wayland. En [Hyprland Wiki](https://wiki.hyprland.org/) encontramos toda la informaciòn e instalaciòn.


## Instalación

Su instalación en ArchLinux es muy sencilla, basta con ejecutar:

```shell
sudo pacman -S hyprland 
```

Instalarà las dependencias necesarias:

- aquamarine-0.8.0-4

- hyprcursor-0.1.12-3

- hyprgraphics-0.1.3-4

- hyprland-qt-support-0.1.0-6

- hyprland-qtutils-0.1.4-2

- hyprlang-0.6.3-1

- hyprutils-0.7.1-1

- hyprwayland-scanner-0.4.4-1

- libspng-0.7.4-2

- tomlplusplus-3.4.0-1

- wayland-protocols-1.44-1

- hyprland-0.49.0-1

### Instalación recomendada

Mi instalación recomendada o en un solo comando, después de recopilar toda mi configuración y dependencias:

```shell
sudo pacman -S hyprland waybar gtklock swayidle swaybg wofi foot networkmanager network-manager-applet wofi archlinux-wallpaper elementary-icon-theme orchis-theme mako wl-clipboard grim wf-recorder slurp ttf-font-awesome xdg-desktop-portal xdg-desktop-portal-wlr pipewire wireplumber pipewire-pulse gst-plugin-pipewire playerctl brightnessctl v4l2loopback-dkm adapta-nokto-gtk-theme gnome-keyring
```

```shell
yay -S wlogout numix-icon-theme-circle
```

```shell
paru -S wlogout numix-icon-theme-circle
```

## Configuración

La ruta de configuración será `~/.config/hypr/`, inicialmente, la primera vez que se inicie hyperlad, creará el archivo de configuración por defecto como `hyprland.conf`, en él encontraremos toda la configuración básica y la referencia a la documentación para cada sección.

### Terminal

Por defecto, hyprland usa `kitty` como terminal, sin embargo, dado que `foot` es una terminal creada para Wayland, la he configurado como terminal por defecto, la cual tiene como atajo de teclado `Super+q`.

> De momento estoy usando los servicios y complementos que tengo instalados con sway, de tal manera que la configuración sea compatible o la conserve, solo he tenido que ajustar waybar

## Vídeo llamadas

###  Captura/compartir pantalla - Navegadores

Importante seguir la configuración que indicó en mi configuración de sway, para ello es importante instalar:

```shell
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-wlr pipewire wireplumber pipewire-pulse gst-plugin-pipewire
```

En mi caso tengo la instalación y configuración con pipewire dado que también uso sway, sin embargo, es importante saber que Wayland tiene un soporte limitado para compartir la pantalla, permitiendo compartir pestañas o toda la pantalla (escritorio o monitor), pero para compartir una aplicación en particular es necesario ejecutar en modo X11 el navegador o aplicación:

```shell
XDG_SESSION_TYPE=x11 brave & disown 
```
### Vídeo en llamadas

Para habilitar la cámara en las vídeo llamadas, es necesario instalar `v4l2loopback-dkm` el cual habilita el vídeo para aplicaciones de streaming, como Meet, Telegram, etc, una vez instalado y reinicado el sistema es detectada la cámara automáticamente.

## Gestión de contraseñas

Por si solo, hyperlad no tiene un gestor de contraseñas, sin embargo, hay algunas herramientas que lo hacen, tales como `gnome-keyring` y `kwalletmanager`. Por esta razón, aplicaciones que requieran guardar/almacenar contraseñas generaran errores si no tiene cómo registrarlos, tal es el caso de `mysql-workbench` que genera un error referente a `The name is not activable`.
En mi caso he instalado `gnome-keyring`, para ello es necesario instalar:

```shell
sudo pacman -S gnome-keyring
```
