# LazyGit

Su creador lod define como `Un simple GUI para Git`. Es una excelente herramienta para gestionar Git en el proyecto.
Su pagina de github es [LazyGit](https://github.com/jesseduffield/lazygit)

## Instalacion

En su pagina de githus se encuentra la documentación de [Instalación](https://github.com/jesseduffield/lazygit#installation), yo documento la instalación de mis entornos o distribuciones:

### Linux

Para `ArchLinux`, la ultima versión estable está disponible en los repositorios de arch, basta con ejecutar:

```bash
sudo pacman -S lazygit
```

### MacOs

Para `macOS`, la ultima versión estable está disponible en [Homebrew](https://brew.sh), basta con ejecutar:

```bash
brew install lazygit
```

> La versión la podemos consultar con `lazygit --version`

## Configuración:

La configuración esta documentada en el enlace [Config.md](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md).

Las rutas por defecto son:

- **Linux**: `~/.config/lazygit/config.yml`
- **MacOS**: `~/Library/Application\ Support/lazygit/config.yml`

Ya que uso `stow` para gestionar mis dotfiles, es conveniente usar la misma configuración para Mac y Linux, para ello es necesario agregar al `.zshrc` lo siguiente:

```bash
export XDG_CONFIG_HOME=$HOME/.config
```

