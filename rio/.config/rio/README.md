# Rio
[Rio](https://rioterm.com/) es una terminal escrita en `rust` y `WebGPU`, reciente. Su repositorio es [GitHub](https://github.com/raphamorim/rio).

## Instalación
### Linux
En `Arch` podemos instalar directamente desde el repositorio oficial:
```shell
sudo pacman -S rio
```
> Para el caso de GPU AMD, solicitará selección del repositorio correcto para el driver, en le caso de `AMD Radeon RX 550 / 550 Series \[Discrete]` lo recomendable es usar `vulkan-radeon`.

### MacOs
Usar la instalación bajo `brew`:
```powershell
brew install --cask rio
```
## Configuración
La ruta de configuración, tanto para `linux` como `macos` es `~/.config/rio/config.toml`.

## Atajos de teclado
He dejado por defecto, salvo aquellos que no funcionan nativamente, como es el caso del desplazamiento entre splits, para listar y buscar los atajos se pude usar `Ctrl+Shift+p`