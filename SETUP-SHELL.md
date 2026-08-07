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

2. Consultar ruta de acceso:hiden

```bash
chsh -l
```

3. Definir como shell por defecto:

```bash
chsh -s $(which zsh)

>También se puede usar la ruta consultada: `chsh -s /usr/bin/zsh`
```

## Prompts

He usado [Oh My Bash](https://ohmybash.nntoan.com/) y [Oh My Zsh](https://ohmyz.sh/), respectivamente. Sin embargo, he optado para usar [Starship](https://starship.rs/), el cual está escrito en `Rust` y es compatible con los sistemas operativos más comunes y shells, en mi caso `zsh` y `bash`
Para instalación y configuración, ver la sección en el directorio de este repositorio para `starship`.

## Zoxide

[Github](https://github.com/ajeetdsouza/zoxide) es un comando de `cd` más inteligente, recuerda y permite saltar a los directorios con más uso frecuente.

### Instalación:

En `arch` basta con ejecutar:

```bash
paru -S zoxide
```

En MacOs con `homebrew`:

```bash
brew install zoxide 
```

### Usos:

1. Se accede normalmente a los directorios usando `cd`, estos serán guardados en el historial y `zoxide` los recuerda.
2. Usando `z` se accede a los directorios, indicando parte o nombre del directorio

```bash
z [nombre]
```

> Se pueden incluir varios nombres, separados por espacio

3. Abrir directorio con selección interactiva, usa `fzf`:

```bash
zi [nombre]
```

> Se puede omitir el nombre, y se listará los directorio frecuentes para sselección

## EZA

[Github](https://github.com/eza-community/eza) es un comando moderno/alternativo de `ls` que permite ver información adicional de los archivos. 
Utiliza colores para distinguir los tipos de archivos y los metadatos. Conoce los enlaces simbólicos, los atributos extendidos y Git. Y es pequeño, rápido y solo un binario.

### Instalación:

En `arch` basta con ejecutar:

```bash
paru -S eza
```

En MacOs con `homebrew`:

```bash
brew install eza
```

### Usos:

Funciona similar a `ls`, por lo que tendremos las mismas opciones y adicional, algunas enriquecidas:

1. Listar infomación extendida: `eza -l`
2. Listar todos los archivos y directorios, incluso ocultos: `eza -a` 
3. Listar árbol de directorios: `eza -T`, especificar nivel con `eza -TL 2`

## Tree

Suelo usar [tree](https://oldmanprogrammer.net/source.php?dir=projects/tree) para listar el árbol del directorio, el cual está en los repositorios de linux y homebrew.

```bash
tree -L 2
```

## FZF

[Github](https://github.com/junegunn/fzf) es un buscador de archivos, directorios y comandos.

### Instalación:

En `arch` basta con ejecutar, ya que está en los repositorio oficiales:

```bash
paru -S fzf
```

En MacOs con `homebrew`:

```bash
brew install fzf
```

## BAT

[Github](https://github.com/sharkdp/bat) es un reemplazo de `cat` que muestra el contenido de los archivos con syntax highlighting.

### Instalación:

En `arch` basta con ejecutar, ya que está en los repositorio oficiales:

```bash
paru -S bat
```

En MacOs con `homebrew`:

```bash
brew install bat
```

## DUF

[GitHub](https://github.com/muesli/duf) Utilidad para mostrar información del disco, alternativa moderna a `df`

### Instalación:

En linux se encuentra en los repositorios oficiales, para el caso de `arch`:

```bash
paru -S duf
```

En MacOs con `homebrew`:

```bash
brew install duf
```

## envchain

[GitHub](https://github.com/sorah/envchain) La mejor forma que he encontrado, sencilla, práctica y eficiente, para almacenar variables de entrono, de tal manera que no se registren directamente en el shell.

### Instalación:

En linux suele estar en los repositorios oficiales, para  `arch` está en `aur`:

```bash
paru -S envchain
```

## Usos:

> NOTE: Suelo agrupar todas las `keys` en el proyecto `apis`, de tal manera que solo cargo `envchain apis env`

1. Almacenar variable:

```bash
envchain --set [name_project] [NAME_KEY]
```
> Ejemplo: `envchain --set apis GITHUB_API_KEY` 
>Esto pedirá la clave que se quiere definir, allí se debe pegar o ingresar.

2. Listar variables:

```bash
envchain --lit
```

3. Mostrar variable:

```bash
envchain [name_project] env
```
> Ejemplo: `envchain apis env`
Este comando cargará todas las variables del espacio mi-proyecto en el entorno y ejecutará env, listando todas las variables de entorno. Verás tus variables junto con todas las demás. Puedes filtrar la salida con grep para buscar específicamente tus claves:

```bash
envchain [name_project] env | grep '[NAME_KEY]'
```

También podemos visualizar solo el valor de la clave:

```bash
envchain [name_project] printenv '[NAME_KEY]'
```
> Ejemplo: `envchain apis printenv GITHUB_API_KEY`

3. Borrar variable: Es necesario usar un gestsor de contraseñas:

- Linux: Se puede usar [seahorse](https://gitlab.gnome.org/GNOME/seahorse) [Secrets](https://apps.gnome.org/es/Secrets/)
- MacOs: Usar `Keychain Access` 

4. Cargar variable al shell: basta con agregar a `~/.bashrc` o `~/.zshrc`:

```toml
export [NAME_KEEY]="$(envchain [name_project] printenv [NAME_KEY])"
```
> Ejemplo: `export GEMINI_API_KEY="$(envchain apis printenv GEMINI_API_KEY)"`

Esto carga solo clave por clave, por lo que es necesario agregar las necesarias
