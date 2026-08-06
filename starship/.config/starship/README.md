# Starship

## Instalación

### Arch

En Arch se puede instalar:

```bash
curl -sS https://starship.rs/install.sh | sh
```

Sin embargo, estoy instalando directamente desde el repositorio oficial:

```bash
pacman -S starship
```

### MacOs

De igual manera que en linux, se puede instalar con el script oficial con `curl`, sin embargo, estoy instalando con `homebrew`:

```bash
brew install starship
```

## Habilitar

Una vez instalado, se debe agregar a `~/.bashrc` o `~/.zshrc`:

```bash
eval "$(starship init bash)"
```

## Configuración

Por defecto, el directorio de configuración es `~/.config/starship.toml.`, sin embargo, en mis `dotfiles` se encuentra en `~/.dotfiles/starship/.config/starship/starship.toml` y manejado con `stow`, ahora bien, es necesario agregar a `~/.bashrc` o `~/.zshrc`:
```bash
export STARSHIP_CONFIG=~/.config/starship/starship.toml
```
