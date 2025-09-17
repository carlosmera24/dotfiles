# Waybar

[Waybar]( https://github.com/Alexays/Waybar/wiki ) Es una barra de estado liviana para sistemas Wayland, con soporte para una gran variedad de monitores y sensores.

# Instalación

Disponible directamente desde pacman, basta con ejecutar `sudo pacman -S waybar`

## Configuración

El archivo de configuración está ubicado en `~/.config/waybar/config.jsonc`, la base se puede copiar desde `/etc/xdg/waybar/config.jsonc` y se puede modificar para personalizarla.

## Estilos

El archivo de estilos se encuentra en `~/.config/waybar/style.css`.

## Fuentes

Mi estilo tiene definido el uso de la fuente `Ubuntu Nerd Font` y `Font Awesome 5 Free`, por tal razón es necesario instalar el paquete `font-awesome` para poder utilizarlo.

```bash
paru -S ttf-ubuntu-nerd ttf-font-awesome-5
```
> O yay `yay -S ttf-font-awesome-5` paquete de AUR y `sudo pacman -S ttf-ubuntu-nerd`
