# Mis scripts

Este directorio contiene scripts especiales que he creado para mi configuración

## Listado de scripts:

### 1. Notificaciones de batería

He creado un `script` para visualizar notificaciones de batería baja o cargada, el cual se encuentra en el directorio
`~/.config/myscripts/` bajo el nombre `baterry-notify.sh`, ya que tengo instalado `mako`, el script lo usará para
visualizar las notificaciones al 30, 20 y 10% de la batería o el 100% cuando carga; adicionalmente, al 80% visualizo
una notificación como recomendación para parar la carga y así cuidar la batería.

### 2. Detección de mayúscula activada

He creado el script `~/.dotfiles/myscripts/.config/myscripts/capslock-status.sh` el cual usa `hyprctl` para detectar si 
el teclado tiene activa la mayúsula y emite un json en formato:

```json
{"text": "3", "alt": "notification"}
```

De esta manera se obtiene el icono usando `listen_cmd` en la configuración de `ashell`.

## Permisos de ejecución

Es importante dar permisos de ejecución para el o los scripts en uso:

```shell
chmod +x ~/.config/myscripts/battery-notify.sh
chmod +x ~/.config/myscripts/capslock-status.sh
```
