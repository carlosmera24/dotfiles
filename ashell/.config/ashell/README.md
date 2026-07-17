# Ashell

Barra de estado lista para usar para Wayland, dado que he tenido algunos problemas con `waybar` en el click del workspace
para Hyperland, he decidio integrar y probar `ashell`.

Como nota a destacar, está scrito en Rust, y es más liviano que `waybar`.

## Instalación

Instalar desde el repositorio de AUR

```bash
paru -S ashell-bin
```

## Configuración

El archivo de configuración se encuentra en la ruta `.config/ashell/config.toml`

## Notificaciones

Para que estén activas, debe estar inhabilitado cualquier demonio de notificaciones, en mi caso, es necesario que  `mako`
no se ejecute, en ese caso he eliminado su inicio desde la configuración de `hyperland`.
