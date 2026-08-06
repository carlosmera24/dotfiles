# SETUP - SHELL

Este es mi detalle de lo que utilizo para mi setup, shell, terminal, herramientas, etc.

## Shell

Por muchos años he utilizado `bash` en linux, pero buscando mejorar mi setup y, después de estar usando MacOs, he decidido usar `zsh`.
En este repositorio tengo versionado y gestionado con stow, la ruta de acceso es `zsh/.zshrc` y al desplegar con `stow` pasa a ser `~/.zshrc`

### Instalación y configuración

1. Instalación:

En `arch` basta con ejecutar:

```bash
sudo pacman -S zsh
```

2. Consultar ruta de acceso:

```bash
chsh -l
```

3. Definir como shell por defecto:

```bash
chsh -s $(which zsh)

>También se puede usar la ruta consultada: `chsh -s /usr/bin/zsh`
```

