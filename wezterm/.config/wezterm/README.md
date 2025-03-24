# WezTerm

WezTerm es un emulador de terminal para la terminal. Tiene un buena compatibilidad con SSH y soporte para ligaduras.

- [Documentación](https://wezfurlong.org/wezterm/)
- [Configuración](https://wezfurlong.org/wezterm/config/)

## Instalación

### MacOs

Podemos instalar descargando la app de [WezTerm](https://wezterm.org/install/macos.html) o instalar con `HomeBrew`:

```bash
brew install wezterm
```

### Linux

En ArchLinux se puede instalar desde los repositorios oficiales:

```shell
sudo pacman -S wezterm
```

Para otras distribuciones podemos verificar el [Link](https://wezterm.org/install/linux.html)

## Configuración

Es necesario crear un archivo de configuración o DotFile, la documentación sugiere `~/.wezterm.lua` o `~/.config/wezterm/wezterm.lua`, pero uso esta última para tener un directorio más limpio y destinado. Al igual que Kitty, tiene un cambio de fuentes en MacOs, para ello he agregado un condicional validando qué sistema operativo está ejecutando y así definir una fuente para Linux o Mac.

## Oh My Bash

En el caso de Linux, me he encontrado que no carga la configuración, he ejecutado el comando:

```shell
soruce ~/.bashrc
```

Y se carga sin problema, es decir, toma el estilo configurado, por esta razón, la solución es crear el archivo `~/.bashrc_profile` y agregar el contenido:

```vim
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
```

Esto forza la carga de la configuración del bashrc dentro de WezTerm
