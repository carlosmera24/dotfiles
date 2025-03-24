# Kitty

Utilizo este terminal para trabajar en conjunto con NeoVim, una alternativa **Alacrritty** y **Terminator**, su [Web]([kitty](https://sw.kovidgoyal.net/kitty/)) [GitHub]([GitHub - kovidgoyal/kitty: Cross-platform, fast, feature-rich, GPU based terminal](https://github.com/kovidgoyal/kitty)). Este repositorio contiene mi configuración.

> Lo mejor de éste terminal es el poder habilitar lingatures con Fira Code, es el único terminal en Linux con el que lo he podido utilizar.

## Instalación

### 1. Linux

#### ArchLinux

Tanto Pacman como Aur tiene actualización constante, solo he visto diferencia en una versión inferior con el repositorio oficial.

```shell
sudo pacman -S kitty
```

#### Debian

En Debian 11 Bullseye basta con correr el comando APT, sin embargo se instala la versión **0.19.3**:

```shell
sudo apt install kitty
```

#### Script automatizado

> Instalación preferida en la actualidad, ya que me permite con el mismo comando instalar y actualizar.

Otra opción que sugiere la documentación es ejecutar un comando, tanto para instalar como para actualizar, pero la instalación queda en un directorio por defecto, **~/.local/kitty.app** en linux y ***/Applications/kitty.app*** en Mac:

```shell
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

Para cambiar la ruta de instalación basta con utilizar el siguiente comando, teniendo en cuenta que la instalación creará el directorio `kitty.app`:

```shell
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sudo sh /dev/stdin dest=/usr/lib/
```

> Utilizar este comando para actualizar

- Agregar kitty al PATH para poder correr el comando:
  
  ```shell
  sudo ln -s /usr/lib/kitty.app/bin/kitty /usr/bin/
  ```

- Agregar al menú de aplicaciones
  
  ```shell
  sudo cp /usr/lib/kitty.app/share/applications/kitty.desktop /usr/share/applications/
  ```

#### Manual

La instalación manual permite tener la última versión y el control del directorio de instalación (/usr/bin/), [Descargando](https://github.com/kovidgoyal/kitty/releases) ***Linux amd64 binary bundle***, sin embargo requiere que el proceso se realice completamente manual, creando la integración del escritorio:

- Agregar la carpeta descargada, después de descomprimir a:
  
  ```shell
  /usr/bin/kitty #kitty es la carpeta que uso como destino
  #Ejmplo:
  sudo mv ~/Descarga/kitty-0.25.2-x86_64 /usr/bin/kitty
  ```

- Agregar kitty al PATH para poder correr el comando
  
  ```shell
  sudo ln -s /usr/lib/kitty/bin/kitty /usr/bin/
  ```

- Agregar al menú de aplicaciones:
  
  ```shell
  sudo cp /usr/lib/kitty/share/applications/kitty.desktop /usr/share/applications/
  ```

- Si se quiere abrir archivos e imagenes desde el explorador de archivos:
  
  ```shell
  sudo cp /usr/lib/kitty/share/applications/kitty-open.desktop /usr/share/applications/
  ```

### 2. MacOs

Basta con instalar el archivo **.dmg** ejecutarlo y moverlo a la carpeta de aplicaciones, sin embargo, para evitar actualizaciones manuales es posible instalarlo desde `homebrew`:

```shell
brew install kitty
```

## Configuración

El archivo de configuración está en */.conf/kiitty/kitty.conf*, en el directorio tengo los subdirectorios:

- `config`: Archivos de configuración adicional

- `themes`: Temas creados

### Tamaño de fuente dinámico

Dado que el tamaño de la fuente varia su escalado en Linux/MacOs, he agreago archivos de configuración para cada sistema operativo en el directorio `config`, teniendo `font-macos.conf`, `font-linux.conf` y `font-bsd.conf`. En la configuración uso la variable de entorno `KITTY_OS` propia de kitty para determinar qué archivo se debe cargar según el sistema operativo:

```vim
include config/font-${KITTY_OS}.conf
```

### 1. Recargar configuración

Para recargar la configuración sin tener que reiniciar **kitty**, es decir, sin cerrar y volver a ingresar, basta con utilizar:

`Ctrl + Shift + F5`

### 2. Fuentes

He habilitado el uso de **Fira Code** con **Lingatures**, es importante instalar las fuentes:

- Fira Code

- Cascaida

- Droid Sans Mono

#### Linux

```shell
#ArchLinux
sudo pacman -S ttf-fira-code otf-droid-nerd ttf-firacode-nerd otf-cascadia-code 
#Actualizar fuentes
fc-cache -v
#Listar o usar con | grep [Name]
fc-list
```

### MacOs

Es necesario y recomendable descargar las fuentes desde el repositorio oficial e instalar individualmente:

- [Fira Code](https://github.com/tonsky/FiraCode/releases)
- [Cascadia](https://github.com/microsoft/cascadia-code/releases)
- [Droid Sans Mono](https://www.fontsquirrel.com/fonts/droid-sans-mono)

> El tamaño de la fuente lo he tenido que variar para Linux y Mac, para lo cual basta con comentar y descomentar según el SO utilizado en las líneas 26 o 28:
> 
> ```sh
> #Linux
>  font_size 12.0
> #Mac
>  #font_size 16.0
> ```

### 3. Tema

Para dar una mejor organización al uso de temas he creado una carpeta `themes/` en donde guardo los temas que me han gustado y que he ido utilizando y dentro del archivo de configuración de kitty agrego la línea:

```pascal
include themes/nombre_theme.conf
```

Temas:

- Tokyo-Night

- Draculla

### 2. Split

Habilité el uso de split para tener en una sola pantalla multiples opciones de terminales, para ello he agregado a la configuración el uso de split `enabled_layouts` y los comandos para su uso, algunos a destacar son:

- `F5` crea split horizontal

- `F6` crea split vertical

- `F7` cambia el split a horizontal/vertical

- `shift` + `[key_arrow]` mueve o cambia de posicipón  el split deseado

- `control` + `[key_arrow]` Ubicarse en el split deseado

- `control` + `shift` + `r` Entrar en modo resizing, permite modificar el tamaño

> En la configuración de **Kitty** agregué la opción para que cada split sea en el actual directorio de trabajo, para ello bastó con agregar  `--cwd current`, ejemplo:
> 
> ```sh
> map f5 launch --location=hsplit --cwd current
> ```
