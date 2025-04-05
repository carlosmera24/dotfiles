# GTKLOCK

Bloqueo de pantalla liviano para Wayland, instalable desde Pacman

## Configuración

Los archivos de configuración son definido en la ruta `~/.config/gtklock/`, por defecto tomará estos archivos:

- `config.ini`: Donde se definen los parámetros de configuración y acepta:
  
  | Clave         | Valor                                                                                                                               |
  | ------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
  | `gtk-theme`   | Define el nombre del tema GTK a usar, previamente debe instalarse                                                                   |
  | `style`       | Define la ruta del archivo CSS, por defecto, sin definirse, tomará el correspondiente a `style.css` del directorio de configuración |
  | `modules`     | Modulos a cargar o habilitar                                                                                                        |
  | `time-format` | Formato de la hora                                                                                                                  |

- `style.css`: Archivo por defecto que será cargado para definir el estilo visual.

[Guìa de configuración](https://github.com/jovanlanik/gtklock/wiki) oficial

## Mi configuración

Para mi configuración estoy usando el tema `Orchis-Dark` para lo cual debemos tener instalado  el tema:

```shell
sudo pacman -S orchis-theme
```

Como hoja de estilos usa por defecto el archivo `style.css` ubicado en el directorio de configuración, en él defino el background a usar, propio de ArchLinux, por lo cual se debe instalar:

```shell
sudo pacman -S 
```
