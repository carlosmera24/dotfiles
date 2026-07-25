# Ashell

Barra de estado lista para usar para Wayland, dado que he tenido algunos problemas con `waybar` en el click del workspace para Hyperland, he decidido integrar y probar `ashell`.

Como nota a destacar, está escrito en Rust, y es más liviano que `waybar`.

## Instalación

Instalar desde el repositorio de AUR

```bash
paru -S ashell-bin
```

## Configuración

El archivo de configuración se encuentra en la ruta `.config/ashell/config.toml`

## Notificaciones

Para que estén activas, debe estar inhabilitado cualquier demonio de notificaciones, en mi caso, es necesario que  `mako` no se ejecute, en ese caso he  eliminado su inicio desde la configuración de `hyperland`.

## Detección de mayúscula activada

He creado el script `~/.dotfiles/myscripts/.config/myscripts/capslock-status.sh` el cual usa `hyprctl` para detectar si 
el teclado tiene activa la mayúscula y emite un json en formato:

```json
{"text": "3", "alt": "notification"}
```

De esta manera se obtiene el icono usando `listen_cmd` en la configuración de `ashell`.

Es importante dar permisos de ejecución al script:

```shell
chmod +x ~/.config/myscripts/capslock-status.sh
```

## Tray

He encontrado un error que me indica que falló la inicialización del servicio:

```text
ERROR [ashell::services::tray] Failed to initialize tray service: org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable
ERROR [ashell::services::tray] Tray service error
```

la solución es tener instalado `libdbusmenu-gtk3` e inicializado el servicio `/usr/lib/libdbusmenu-gtk3/status-notifier-watcher`, para ello he agregado su inicio en `hyprland`.
