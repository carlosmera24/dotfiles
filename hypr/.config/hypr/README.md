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
paru -S pass-secret-service-bin
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
exec-once = pass-secret-service -d
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

2. Editar la configuración de `greetd` en `/etc/greetd/config.toml`, modificando la linea `command` por:

```toml
command = "sway -c /etc/nwg-hello/sway-config"
```

3. Iniciar el servicio de `greetd`:

```shell
sudo systemctl enable  greetd
```
> Previamente se debe deshabilitar `lightDM` o `GDM` con `systemctl disable lightdm.service` o `systemctl disable gdm.service`
