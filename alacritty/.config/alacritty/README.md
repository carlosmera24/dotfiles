# Alacritty

Utilizó esta terminal para trabajar en conjunto con NeoVim, [GitHub]([GitHub - alacritty/alacritty: A cross-platform, OpenGL terminal emulator.](https://github.com/alacritty/alacritty)).

Este repositorio contiene el respaldo del archivo de configuración (*alacritty.yml*) y la guía de instlación

## Instalación

### 1. Repositorio (DEB)

Se puede instalar utilizando un repositorio, facilita la instalación en distribuciones como **Mint**:

```shell
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update && sudo apt install alacritty
```

### 2. Snap

```shell
sudo snap install alacritty --classic
```

### 3. Compilación (Preferida y probada en Debian 11)

> Con ésta instalación tengo control total de qué instalar y dónde

#### 3.1. Instalar Rust:

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

> A este pundo se podría instalar Alcritty en el directorio home del usuario ejecutando:
> 
> ```shell
> cargo install alacritty
> ```

#### 3.2. Dependencias:

```shell
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
```

#### 3.3. Instalar Alacritty

Partir de la clonación del repositorio oficiial:

```shell
git clone https://github.com/alacritty/alacritty.git
cd alacritty
#Construir
cargo build --release
#Valiidar
infocmp alacritty
#Si no nos da respuesta con la información es necesario:
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
```

Se finaliza la compilación, ahora es necesario agregar el ejecutable a la ruta deseada y crear el acceso directo, ya sea por consola o con algun asistente, así como crear el enlace simbolico para poder ejecutarlo desde cualquier ubicación:

```shell
#Mover alacritty a la ruta deseada de instalación
sudo cp target/release/alacritty /usr/lib/alacritty/
#Copiar Icono
sudo cp extra/logo/alacritty-term.svg /usr/lib/alacritty/
#Crear acceso directo
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```

## Configuración

Parto del archivo base copiado a la ruta de configuración desde el repositorio clonado en su raíz

```shell
# Nueva configuración requerida
cp alacritty.toml ~/.config/alacrity/
#anterior configuración
cp alacritty.yml ~/.config/alacritty/
```
