# Harlequin

[Harlequin](https://harlequin.sh/) en un cliente de base de datos para terminal.

## Instalación:

A pesar de tener instalación nativa para Linux, lo recomendable es instalar desde `uv` de python:

1. Installar `uv`:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

2. Instalar `harlequin`:

```bash
uv tool install harlequin
```

## Instalar adaptadores:

Para que la conexión funcione, es necesario instalar el adaptador correcto para la base de datos a usar:

```bash
uv tool install 'harlequin[mysql]'
```


## Configuración

Hay diferentes formas de usar o definir la configuración:

- Crear un archivo por directorio de trabajo, donde se puede crear un archivo .harlequin.toml
- Crear un archivo global desde `~/.config/harlequin/config.toml`

De igual manera, se puede usar el asistente para creación o actualización del archivo:

```bash
harlequin --config
```

Este guiará y solicitará la información paso a paso.

### Configuración definida

En mi caso, estoy definiendo la configuración de forma global para consolidar todos mis perfiles en un solo archivo y
así tener portabilidad del mismo

TODO: Validar ruta para MacOs, tal vez requiera agregar variable de entorno en el zsrc
export HARLEQUIN_CONFIG_PATH=/path/to/my/file.toml
