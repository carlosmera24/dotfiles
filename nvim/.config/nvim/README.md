# NeoVim

Contenedor de configuración del editor [**NeoVim**](https://neovim.io/), el cual mejora a [**Vim**](https://www.vim.org/).

## Ramas según configuración

Para tener un mayor control y libertad de la configuración, así como el tipo y gestores de plugins, he creado ramas diferenciando su estructura:

- `master`: Rama actual en uso principal con `lua` `lazy`

- `vim-plug`: Rama con archivos `vim` y plugins `plug`. Es la copia de uso incial.

## Instalación:

1. En **debian** se puede instalar desde los repositorios oficiales:
   
   ```
   sudo apt install neovim
   ```
   
   > También se sugiere el uso de [Brew](https://brew.sh) para tener la última versión.
   > 
   > **OJO:** Es la mejor opción a la fecha, en especial en Debian 11
   
   ```shell
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   
   Instalación de **AppImage** como alternativa:
   
   ```shell
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
   chmod u+x nvim.appimage
   ./nvim.appimage
   #Luego agregar el comando globalmente, pues da error al ejecutar el comando nvim
   ./nvim.appimage --appimage-extract
   ./squashfs-root/AppRun --version
   sudo mv squashfs-root / && sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
   nvim
   ```
   
   **Arch Linux** se puede instalar directamente desde `pacman` o `yay` con la última actualización:´
   
   ```shell
   sudo pacman -S neovim
   ```
   
   **Mac** Utilizamos el instalado de **Brew**, partiendo de él ejecutamos:
   
   ```shell
   brew install neovim
   #Update
   brew upgrade neovim
   #Update all and homebrew itself
   brew update
   #Upgrade everything:
   brew upgrade
   ```

> En Mac con M1 se debe utilizar el comando `arch -x86_64 brew` de esa manera no se tendrán problemas o errores

2. Instalar librerías python
   
   - **Linux:**            
   
   ```shell
   sudo apt install python-pip python3-pip #Agregar según se requiera
   python -m pip install neovim
   #debian 11
   python3 -m pip install neovim
   ```
   
   - **Mac**:
   
   ```shell
   brew install python
   /usr/local/bin/pip3 install neovim
   /usr/local/bin/pip3 install --upgrade neovim
   ```

3. Se recomienda mantener las librerías de Python actualizadas:
   
   - **Linux:**
   
   ```shell
   python -m pip install --upgrade neovim
   ```
   
   - **Mac:**
   
   ```shell
   /usr/local/bin/pip3 install --upgrade neovim
   ```

4. Instalar librerías ruby
   
   - **Linux:**
   
   ```shell
   sudo apt install ruby ruby-dev
   ```
   
   - **Mac:**
   
   ```shell
   brew install ruby
   ```

5. Instalar interfaz de ruby, tanto Linux como Mac
   
   ```shell
   sudo gem install neovim
   ```

6. Comprobar dependencias *NeoVim*:
   
   ```shell
   nvim +checkhealth
   ```

7. Habilitar la integración con el portapapeles: se puede instalar xclip o xsel con apt
   
   ```shell
   sudo apt install xclip
   ```

## Configuración

NeoVim utiliza la configuración en el archivo **init.lua** para la nueva versión con **lua**, aunque utilizar archivos `.vim` es totalmente funcional. Está configuración debe estar en la ruta _~/.config/nvim/_  y la estructura es la siguiente:

```shell
.
|-- init.lua
|-- lua
|   |-- core
|       |-- lazy.lua
|       |-- maps.lua
|       |-- neovide.lua #Configuración estandar y sencilla para neovide
|       |-- plugins
|           |--... #Archivos .lua por plugin
|           |--plugins.lua #Definición de plugins sin configuración
|           |--colorscheme.lua #Tema, plugin y configuración.
|       |-- settings
|           |-- init.lua #Configuración general
|           |-- folding.lua #Definición de configuración y manejo de fold
|-- README.md
```

> Esta estructura la he definido para usar como gestor de paquetes [Lazy](https://github.com/folke/lazy.nvim) ya que los mismos creadores de [Packer](https://github.com/wbthomason/packer.nvim) utilizan lazy en su contenido. La carpeta plugins contiene el requerimiento y configuración de cada plugin, así como los keys map para los mismos, lo que permite tener mayor organización y control.
> 
> [Neovide](https://neovide.dev/index.html) es una interfaz simple para Neovim escrita en Rust, configurable, suelo usar [Kitty terminal](https://sw.kovidgoyal.net/kitty/) pero es una opción simple y con algunos efectos gráficos agradables para probar.

La ruta utilizada para la configuración y archivos es `~/.local/share/nvim/lazy/lazy.nvim` la cual está definida en `core/lazy.lua`, es importante tener presente esta ruta en casos de requerir limpiar manualmente algun plugin.

## Paginas y recuersos

1. [VimAwesome](https://vimawesome.com/): Plugins.

2. [Neovimcraft](https://neovimcraft.com/): Plugins, Temas.

3. [This week in neovim](https://this-week-in-neovim.org/): Recopilación de noticias, actualizaciones, nuevos temas, entre otros datos de interes.

## Maps Generales:

- `space` Tecla lider

- `space+w` Guardar

- `space+q` Salir

- `Ctrl+t` Abrir terminal

- `Shift+Tab` Siguiente buffer o pestaña (`:Bnext`)

- `space+tab` Anterior buffer o pestaña (`:BPrevious`)

- `space+Backspace` Borrar buffer actual (`:BDelete`)

- `space` Abrir explorador nativo de vim (`:Ex`)

- `space+fi` Definir foldmethod indent

- `space+fm` Definir foldmethod manual

- `space+zs5` Pliega (Collapse) todos los folds para la documentación de L5Swagger, requiere foldmethod manual

- `space+fa` Pliega (Collapse) todo el contenido 

- `Alt+r` Regarca vimrc (`:source $MYVIMRC`), util para recargar después de cambios en Vim w

## Plugins y temas

Para gestionar los temas he utilizado [Lazy](https://github.com/folke/lazy.nvim), definiendo la instalación en el archivo `init.lua` y los plugins en la carpeta `plugins`. Una gran diferencia con Plug-Vim es la instalación al inicio automática y poder definir que plugins quiero instalar para el tipo de archivos y/o el inicio cuando se invoca un comando o tecla.

### Lazy plugins configuración

Dentro de las opciones que tenemos para configurar los plugins:

1. Estructura:
   
   ```lua
   return {
       {
           'nombre-plugin'    
          -- Opciones del plugin 
       } 
   }
   ```

2. `branch` Define la rama del plugin a instalar.

3. `dependencies` Array de las dependencias que utiliza el plugin

4. `keys` Keys que permitirán inicar el plugin, adicionalmente definen las keys que usará el plugin

5. `config` functión que define la configuración del tema:
   
   ```lua
   config = function()
       -- Configuración
   end
   ```

6. `ft` Define los tipos de archivos para los cuales se auto iniciará el plugin (Lazy-load)

### Plugins

#### IndentLine:

[Vim Awesome](https://vimawesome.com/plugin/indentline) [GitHub](https://github.com/yggdroot/indentline) Permite visualizar las indentaciones presentes en el archivo.

#### LuaLine:

[GitHub ](https://github.com/nvim-lualine/lualine.nvim). Bara de estado optimizada, según recomendaciones en la web, es más ligero, pasa a reemplazar **Vim AirLine**   

> Importante instalar primero el plugin con PlugInstall/PlugUpdate y luego habilitar la configuración para evitar errores.

#### BufTabLine:

[GitHub](https://github.com/ap/vim-buftabline) [Vim Awesome](https://vimawesome.com/plugin/buftabline) Tras no usar *Vim AirLine* es necesario tener otro tab para mostrar los buffers activos, esta funcionalidad la permite este plugin, sencillo y práctico, para iniciar solo basta con la instalación

#### Vim Airline:

[Vim Awesome](https://vimawesome.com/plugin/vim-airline-superman) [GitHub](https://github.com/vim-airline/vim-airline) Modifica la visualización de la barra inferior, puede instalarse vim-airline-themes [Vim Awesome](https://vimawesome.com/plugin/vim-airline-themes) [GitHub](https://github.com/vim-airline/vim-airline-themes) para ampliar la posibilidad de temas.

**Ajuste de fuentes**: Para que visualice correctamente con > en la información, es necesario instalar la fuente power line:

> IMPORTANTE: Validar la documentación de Kitty e instalar las fuentes definidas allí.

- **Linux:**
  
  ```shell
  sudo pip install powerline-status
  sudo apt-get install fonts-powerline
  #Arch
  sudo pacman -S powerline-fonts otf-droid-nerd ttf-fira-code 
  ```

- **Mac:**
  
  ```shell
  /usr/local/bin/pip3 install powerline-status
  #fonts-powerline
  # clone
  git clone https://github.com/powerline/fonts.git --depth=1
  # install
  cd fonts
  ./install.sh
  # clean-up a bit
  cd ..
  rm -rf fonts
  ```
  
  Luego agregar a la configuración de Vim:
  
  ```shell
  let g:airline_powerline_fonts = 1
  ```

- La integración con Git solo está disponible al instalar los plugins fugitive.vim, gina.vim, lawrencium, vcscommand.

#### NVIM-TREE

[GitHub](https://github.com/nvim-tree/nvim-tree.lua) Reemplazando Nerd-Tree, de igual manera permite tener un arbol de directorios y archivos para explorar el poryecto actual, escrito en Lua.

- `g?` permite listar las opciones sobre el archivo o directorio

- `<leader>e`: `:NvimTreeFocus`

- `<Ctrl-e>`: `NvimTreeToggle` Abrir/Cerrar Explorador

- `<Ctrl-f>`: `:NvimTreeFindFile` Ubica el archivo abierto en el explorador

- `<Alt-e>`: `:NvimTreeCollapse` Collapsa o recoge recursivamente todos los directorios.

#### Nerd Tree:

> Usnado NVIM-Tree

[Vim Awesome](https://vimawesome.com/plugin/nerdtree-red) [GitHub](https://github.com/preservim/nerdtree) Permite tener un árbol de directorios para explorar el proyecto o carpetas. En la documentación se recomiendan algunos comandos a configurar para no tener que ejecutar comandos como *:NERDTree, :NERDTreeFind, NERDTreeToggle* entre otros, de igual manera recomienda otros plugins y configuraciones que podemos aplicar de acuerdo a nuestros gustos y necesidades.

#### Vim-Devicons:

> IMPORTANTE: Validar la documentación de Kitty e instalar las fuentes definidas allí.

[Vim Awesome](https://vimawesome.com/plugin/vim-devicons) [GitHub](https://github.com/ryanoasis/vim-devicons) Integración de iconos para NerdTree. Para su instalación es necesario instalar una fuente compatible, yo utilizo la opción 6 en la doucumentación [GitHub - ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts#font-installation), para Linux:

```shell
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
```

   Para **Mac** utilizo la opción 4:

```shell
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
#Aunque al final opto por:
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

> Recomendable usasr iTerm2 y en el perfil usar una fuente diferente para Non-ASCII y seleccionar *DroidSansMono  Nerd Font* y actuar el uso de ligaduras.s

#### Nerd-Tree-Git-Plugin:

[Vim Awesome](https://vimawesome.com/plugin/nerdtree-git-plugin) [GitHub](https://github.com/xuyuanp/nerdtree-git-plugin) Permite identificar los cambios en los archivos para Git en NerdTree.

#### Vim-NerdTree-Syntax-Highlight:

[Vim Awesome](https://vimawesome.com/plugin/vim-nerdtree-syntax-highlight) [GitHub](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight) Resalta en diferentes colores los iconos de los tipos de archivos, trabaja en conjunto con **Vim-Devicons**

#### Auto-Pairs:

[Vim Awesome](https://vimawesome.com/plugin/auto-pairs) [GitHub](https://github.com/jiangmiao/auto-pairs) Autocompleta comillas, llaves, parentesis, etc, muy util.

#### vim-closetag:

[GitHub](https://github.com/alvan/vim-closetag) Cierra etiquetas automáticamente.

#### vim-surround:

[GitHub](https://github.com/tpope/vim-surround) Permite encapsular o encerrar palabras o selección en comillas, parentesis, llaves, etc, para su uso se debe seleccionar lo deseado -1 caracter  y luego presionar `<leader>+S` y presionar el  `caracter_deseado` 

#### FZF-Vim:

[Vim Awesome](https://vimawesome.com/plugin/fzf-vim) [GitHub](https://github.com/junegunn/fzf.vim) Integra funcionalidades para realizar busqueda de archivos con el complemento para terminal **FZF** ([Vim Awesome](https://vimawesome.com/plugin/fzf) [GitHub](https://github.com/junegunn/fzf)), trabajando en conjuto con `Ripgrep` y `Ag(The silver searcher)`. Según la documentación encontrada, FZF es un buscador de archivos para terminales muy rápido y versatil, para instalarlo en Vim es necesario primero realizar la instalación en el sistema de la siguiente manera:

##### 1. Instalar FZF en el sistema

 En la documentación oficial está las diversas posibilidades para instalar, para mi caso lo realizo utilizando mi gestor de paquetes (Debian APT)

```shell
sudo apt install fzf
```

> A este punto podemos ejecutar en terminal **fzf**  y presionar **Enter**, inmediatamente listara los archivos y podemos ingresar la busqueda que queramos en el directorio actual, nos desplazamos usando las flechas del teclado y al presionar **Enter** finaliza el programa listando el documento seleccionado. **Ctrl+R** para buscar en comando.

##### 2. Instalar Ripgrep

Se recomienda la instalación para implementar la buscar texto dentro de los archivos usando el comando `:Rg`, su instalación es similar y se pude encontrar la docuemntación en [GitHub](https://github.com/BurntSushi/ripgrep)

```shell
sudo apt install ripgrep
```

> Podemos ejecutarlo con **rg -i [cadena a buscar]**

 Para integrarlo con **FZF** es necesario agregar la siguiente función en *.bashrc* o *.zshrc* según el shell usado, en mi caso es bashrc en *~/.bashrc*

```shell
fif() {
 if [ !"$#" -gt 1 ]; then echo "Need a string to search for!"; return 1; fi
        rg --files-with-matches --no-messages $1 | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 $1 || rg --ignore-case --pretty --context 10 $1 {}"
}
```

Esto habilita el comando *fif* en la consola, para lo que es necesario ejecutar *source ~/.bashrc* o cerrar y volver a abrir la consola. Podemos hacer busquedas dentro de **FZF** ejecutando *fif cadena_a_buscar*. 

 También podemos integrarlo dentro de **FZF** agregando al ~/.bashrc:

```shell
if type rg &> /dev/null; then
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
```

> Hasta el momento no veo una gran funcionalidad, con la integración anterior para el comando *fif* basta,

##### 3. The Silver Searcher (Ag)

[GitHub](https://github.com/ggreer/the_silver_searcher) Esta opción es alternativa y permite hacer busqueda de textos a través del comando `:Ag`, hay varias formas de instalarlo en el sistema operativo:

```shell
#Debian
apt-get install silversearcher-ag
#Arch
sudo pacman -S the_silver_searcher
#Linux/Mac
brew install the_silver_searcher
```

La versión instalada en Debian, a la fecha, es `2.2.0`

```shell
ag -V
ag version 2.2.0
Features:
  +jit +lzma +zlib
```

##### 4. Instalar el plugin FZF.VIM

Agregar a la configuración de NeoVim:

```shell
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
```

Se recomiendo *'junegunn/fzf', { 'do': { -> fzf#install() } }* para garantizar que tengamos la última versión de **FZF**

#### 5. Maps:

- `leader+t`: Buscar archivos

- `leader+F`: Buscar cadena dentro de los archivos con Rg

- `leader+G`: Buscar cadena dentro de los archivos con Ag

#### Git

1. **Fugitive.vim**: [Vim Awesome](https://vimawesome.com/plugin/fugitive-vim) [GitHub](https://github.com/tpope/vim-fugitive) Integra comandos para el uso de git, además se integra muy bien con **Airline**, se puede invocar utilizando `:G` o `:Git` para visualizar el estado e información del proyecto actual, a su vez se complementa con todos los comandos de git, ejemplo: `:G status`.

2. **vim-gitgutter:** [Vim Awesome](https://vimawesome.com/plugin/vim-gitgutter) [GitHub](https://github.com/airblade/vim-gitgutter) Resalta dentro de los archivos los cambios realizados.

#### Sintanxis Y Completado LSP:

Migre a LSP depués de usar COC por mucho tiempo, para ello he usado [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) ya que permite integrar de una manera muy sencilla LSP con mason, lspconfig y mason-slpconfig, de igual manera integra cmp y Snippets con LuaSnip. Hasta el momento es la manera más sencilla de integrar estas herramientas.

- `lua/core/plugins/lsp/`: las especificaciones del plugin las defino en esta carpeta,
  
  - `init.lua` para definir los requerimientos a instalar y la configuración del plugin.
  
  - `servers.lua` definición de los servidores LSP que deseo que se instalen automáticamente al ejecutar Mason, los servidores diponibles se pueden listar en [nvim-lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)

- `:Mason` Me permite acceder al menú de control de los servidores LSP, instalar, actualizar, eliminar y listar. Aunque al definir el archivo `servers` los servidores se instalan automáticamente en el inicio de nvim, preguntando si se dea instalar el listado.

- Maps por default:
  
  - `K`:  Muestra información del simbolo en cursor. Ver [:help vim.lsp.buf.hover()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.hover()).
  
  - `gd`: Ir a la definición del simbolo en cursor. Ver [:help vim.lsp.buf.definition()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.definition()).
  
  - `gD`: Salta a la declaración. Algonos servidores no lo implementan esta función. Ver [:help vim.lsp.buf.declaration()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.declaration()).
  
  - `gi`: Lista todas las implementaciones para el símbolo bajo el cursor en la ventana quickfix. Ver [:help vim.lsp.buf.implementation()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.implementation()).
  
  - `go`: Salta a la definición del tipo del símbolo bajo el cursor. Ver [:help vim.lsp.buf.type_definition()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.type_definition()).
  
  - `gr`: Lista todas las referencias al símbolo bajo el cursor en la ventana quickfix. Ver [:help vim.lsp.buf.references()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.references()).
  
  - `<Ctrl-k>`: Muestra información de firma sobre el símbolo situado bajo el cursor en una ventana flotante.. Ver [:help vim.lsp.buf.signature_help()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.signature_help()). 
  
  - `<F2>`: Cambia el nombre de todas las referencias al símbolo situado bajo el cursor. Ver [:help vim.lsp.buf.rename()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.rename()). TODO: Cambiar key, entra en conflicto con Kitty
  
  - `<Ctrl-F4>`: Selecciona una acción de código disponible en la posición actual del cursor. Ver [:help vim.lsp.buf.code_action()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.code_action()).

##### Sintaxis con treesitter

[Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Permite inegrar el resaltado de sintaxis implementando [Treesitter](https://tree-sitter.github.io/tree-sitter/). Este plugin permite ir anexando los lenguajes que se quieren tener e incluso excluir, todo está en su documentación oficial, toda la configuración la he definido en el archivo `plugins/treesitter.lua`

- El listado de lenguajes se definen en la variable u opción `ensure_installed`, los leguajes requeridos para el funcionamiento de nvim son `c`, `lua`,`vim`

- Keys map:
  
  - `Ctrl+space`: Incrementar/Iniciar selección
  
  - `Backspace`: Decementar selección
  
  - `textobjects`: Permite seleccionar rápidamente ingresando en modo visual(`:v`):
    
    - `af`: "Seleccionar la función externa" (Select the outer function).
    - `if`: "Seleccionar la función interna" (Select the inner function).
    - `ac`: "Seleccionar la condición externa" (Select the outer conditional statement).
    - `ic`: "Seleccionar la condición interna" (Select the inner conditional statement).
    - `al`: "Seleccionar el bucle externo" (Select the outer loop).
    - `il`: "Seleccionar el bucle interno" (Select the inner loop).

> Para `blade` (Laravel) no hay un soporte directo, por lo que me es necesario usar un plugin adicional, **vim-blade**.

###### Comentarios

> Con el cambio de `vim-commentary` a `Comment` no veo necesario el uso del plugin `nvim-ts-context-commentstring`, ya que `Comment` integró coporte para `treesitter`, sin embargo opto por dejarlo como una dependencia por si necesito realizar algún caso de uso avanzado, aunque hasta el momento me funciona con `vue` perfectamente.

Para integrar correctamente los comentarios, en conjunto con **vim-commentary** se instala [nvim-ts-context-comentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring), definido y configurado en el mismo archivo del plugin (`plugins/treesitter.lua`), esto añade soporte para VUE de manera correcta

##### Plugins para sintaxis

> Reemplazados por treesitter, excepto **vim-blade** ya que no hay un soporte official o de terceros para treesitter

1. **Vim-Vue:** [Vim Awesome](https://vimawesome.com/plugin/vim-vue-fearless) [GitHub](https://github.com/posva/vim-vue) 

2. **Vim-Blade:** [Vim Awesome](https://vimawesome.com/plugin/vim-blade-shouldve-said-no) [GitHub](https://github.com/jwalton512/vim-blade) 

3. **Vim-Laravel:** [Vim Awesome](https://vimawesome.com/plugin/vim-laravel-face-rejection) [GitHub](https://github.com/noahfrederick/vim-laravel) 

4. **Typescript-Vim:** [Vim Awesome](https://vimawesome.com/plugin/typescript-vim) [GitHub](https://github.com/leafgarland/typescript-vim) 

5. **Vim-JavaScript:** [Vim Awesome](https://vimawesome.com/plugin/vim-javascript) [GitHub](https://github.com/pangloss/vim-javascript) 

6. **PHP-Vim:** [Vim Awesome](https://vimawesome.com/plugin/php-vim-shouldve-said-no) [GitHub](https://github.com/stanangeloff/php.vim) 

7. **Vim-Php-CS-Fixer:** [Vim Awesome](https://vimawesome.com/plugin/vim-php-cs-fixer) [GitHub](https://github.com/guenti/vim-php-cs-fixer) Con **PHP-Vim** basta para resaltar la sintaxis.

8. **vim-polyglot**: [GitHub](https://github.com/sheerun/vim-polyglot) Contiene el resaltado de sintaxis para muchos programas o una gran mayoria, para deshabilitar alguno basta con:
   
   ```shell
   let g:polyglot_disabled = ['markdown']
   ```
   
   > Para mayor información se puede consultar la documentación oficial

9. 

#### EditorConfig-Vim:

> De momento no está siendo utilizado -No instalado-

[Vim Awesome](https://vimawesome.com/plugin/editorconfig-vim) [GitHub](https://github.com/editorconfig/editorconfig-vim) Este complemento permite ingrar la configuración del editor como identación y tabulado importando configuración de [EditorConfig](https://editorconfig.org/) para lo cual se requiere crear el arcvhio *.editorconfig* en la raíz del proyecto.

#### Emmet.Vim:

> No utilizado lo reemplazo por servidor emmet-ls en LSP

[Vim Awesome](https://vimawesome.com/plugin/emmet-vim) [GitHub](https://github.com/mattn/emmet-vim) Generación de código a partir de abreviaciones similar a [Emmet](https://emmet.io/), ejemplo:

```html
<!-- div>p#foo$*3>a -> Presionar Ctr+y, genera:-->
 <div>
      <p id="foo1">
          <a href=""></a>
      </p>
      <p id="foo2">
          <a href=""></a>
      </p>
      <p id="foo3">
          <a href=""></a>
      </p>
  </div>
```

#### VIM-INTERESTINGWORDS:

[Vim Awesome](https://vimawesome.com/plugin/vim-interestingwords-safe-and-sound) [GitHub](https://github.com/lfv89/vim-interestingwords) Permite seleccionar palabras y sus ocurrencias en el texto, uso simpre, seleccionar palabra y presionar _<leader>+k_ para resaltar y _<leader>+K_ para eliminar el resaltado; y navegar entre las ocurrencias utilizando _<leader>+n_ y _<leader>+N_.

#### vim-visual-multi:

> Dada la dificultad para configurar los keys/maps en Lazy, opto por usar directamente los comando de VIM:
> 
> - `Crtl+v` Activar seleción por lineas, una vez activado usar las felchas o `j` o `k` para desplazarse.
> 
> - `Shift+i` Activa la edición

[GitHub](https://github.com/mg979/vim-visual-multi) Permite selección de multiples líenas, propicio para editar al mismo tiempo:

- Seleccionar palabas con `Ctrl-n` (Salir con `Ctrl-d` )

- Crear cursores verticalmente `Ctrl-Down/Ctrl-Up`
  
  > Modificado a `Alt+Up/Down` ya que en Kitty no me funciona al utilizar split, pues ese atajo pertenece a otra función

- Seleccionar un caracter a la vez `Shift-Arrows`

- Presionar `n/N` para  next/previous ocurrencia

- Presione `[/]` para seleccionar siguiente/anterior cursor

- Presione `q` para salir del acual y obtener la siguiente ocurrencia

- Presione `Q` para remover el actual curos/selección

- Iniciar modo inserción con `i,a,I,A`

- Habilitar el uso del cursor agregar `let g:VM_mouse_mappings = 1` en el archivo de configuración, seleccionar con `Ctrl-Click` y salir con `Ctrl-Click derecho`

#### Comentarios

##### Comment

> Plugin actualmente utilizado en compatibilidad con `Vue` y `Treesitter`

[GitHub](https://github.com/numToStr/Comment.nvim) pase a reemplazar los plugins `vim-commentary` y `vim-context-commentstring` ya que no me daban buena compatibilidad con `vue` implementando `treesitter`. Los comandos o atajos del teclado son similares a los otros plugins:

- Modo normal:
  
  - `gcc` - Toggles the current line using linewise comment
  
  - `gbc` - Toggles the current line using blockwise comment
  
  - `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
  
  - `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
  
  - `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
  
  - `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

- Modo visual:
  
  - `gc` - Toggles the region using linewise comment
  
  - `gb` - Toggles the region using blockwise comment

##### Con soporte para VUE/JS:

Inicialmente usé **nvim-comment** citado en el siguiente punto, pero no me fue posible activar el soporte para VUE, indagando me encontré una combinación de dos plugins, [vim-commentary](https://github.com/tpope/vim-commentary) y [vim-context-commentstring](https://github.com/suy/vim-context-commentstring), este ultimo agrega el soporte para VUE, los comandos son similares a los de **nvim-comment**:

- Comentar/Descomentar linea o selección actual `gcc`

- Comentar lineas arriba/abajo `gc{count}{motion}` donde *count* es el numero de lienas a comentar y *motion* la dirección (j|k|flechas).

##### Nvim Commnet:

  `Reemplazado por "vim-comentary", ya que tiene soporte para VUE al instalar "vim-context-commentstring"` [GitHub](https://github.com/terrortylor/nvim-comment) Permite agregar comentario o commentar lineas de codigo:

- Comentar/Descomentar linea actual `gcc` 

- Comentar lineas arriba/abajo `gc{count}{motion}` donde *count* es el numero de lienas a comentar y *motion* la dirección (j|k|flechas).

- Comenta/Descomenta un párrafo `gcip`

- Comenta/Descomenta linea actual `gc4w` 

- `gc4j` comment/uncomment 4 lines below the current line

- Borra bloque comentado `dic`

- Descomenta un bloque `gcic` 

#### Colorizer:

  [GitHub]([GitHub - chrisbra/Colorizer: color hex codes and color names](https://github.com/chrisbra/Colorizer) Resaltar los colores con su color correspondiente:

- `:ColorHighlight`: Resaltar colores `<Alt+c><Alt+h>`

- `:ColorClear`: Limpiar resaltado `<Alt+c><Alt+c>` 

- `:h colorizer`: Ayuda y más comandos

#### Vim-matchopen:

  [GitHub](https://github.com/arnar/vim-matchopen) Resalta parentesis:

- `:DoMatchLasOpen`: Habilitar

- `:NoMatchLastOpen`: Inhabilitar 

> Nota: Generá lentitud al cargar archivos muy grandes, no he podido encontrar una forma de deshabilitarlo al inicio, por ahora lo dejo comentado, es decir, no instalado.

#### Telecope

[GitHub](https://github.com/nvim-telescope/telescope.nvim) Instalado con las dependencias

```lua
'nvim-lua/plenary.nvim',
'sharkdp/fd',
"nvim-telescope/telescope-file-browser.nvim"
"nvim-telescope/telescope-live-grep-args.nvim"
```

##### Dependencias externas sugeridos.

`checkhealth telescope` permite validar el estado de Telescope y los complementos sugeridos, entre ellos:

- **rg**: Correspondiente a `ripgrep` Ver [Instalar Ripgrep](#2.-instalar-ripgrep)

- **fd**: [GitHub](https://github.com/sharkdp/fd) 
  
  ```shell
  sudo apt install fd-find
  #Arch
  sudo pacman -S fd
  ```

##### Maps

Configuración de comandos definido en `map.vim`

- `<leader>ff ` Telescope find_files

- `<leader>fg` Telescope live_grep

- `<leader>fb` Telescope buffers

- `<leader>fh` Telescope help_tags

- `<leader>fs` In mode `v` and `v`, start live grep with cursor or selecction. fg fg

- `<leader>fe` Telescope file browser

- `<leader>fce` Telescope file browser with the path of the current bufferss

- Maps de interacción dentro de `File Explorer`:
  
  - `Tab` Seleccionar
  
  - `Alt-c` Crear
  
  - `Alt-r` Renombrar
  
  - `Alt-m` Mover los archivos/foder seleccionados a la ubicación actual.
  
  - `Alt-y` Copiar selección a la ruta actual
  
  - `Alt-d` Borrar
  
  - `Ctrl-h` Mostrar/ocultar archivos/folder ocultos
  
  - `Ctrl-f` Cambiar vista entre file y folder

- Opciones de filtro para [Telescope-live-grep-args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim):
  
  - `"word_search" -g "path/directory/*"`
  - `"word_search" -t file_type` Ej: `"table" -t js`
  - `"word_search" --iglob`

#### Oil Vim

Explorador de archivos estilo editor texto [GitHub](https://github.com/stevearc/oil.nvim), todo el CRUD se realiza a nivel del editor de texto. Mi configuración está para que se inicialice el plugin al presionar `-` o ejecutar `:Oil`, de igual manera uso el modo flotante

##### Maps

- `-` Abrir explorador en el directorio actual en modo `Normal`.

- `g?` Mostrar ayuda.

- `Enter` Abrir ubicación

- `Ctrl+s` Abrir archivo seleccionado Split vertical

- `Ctrl+h` Abrir archivo seleccionado Split horizontal

- `Ctrl+t` Abrir archivo seleccionado en tab/buffer

- `Ctrl+p` Abrir preview (`Requiere configurción adicional`)

- `Ctrl+c` Cerrar

- `Ctrl+l` Refrescar

- `-` Retornar o regresar

- `_` Abrir CWD

- ` cd

- `~` tcd

- `gs` Ordenar

- `gx` Abrir external

- `g.` Cambiar visualización de archivos ocultos

- `g\\` Cambiar a papelera/Trash

#### Glow

Este plugin permite inetegrar facilmente la visualización previa de un documento `markdown` con [Glow](https://github.com/charmbracelet/glow).
Para instalarlo, en sistemas Linux/Mac podemos usar brew:

```shell
brew install glow
#Arch
sudo pacman -S glow
```

El plugin lo podemos encontrar en el [link](https://github.com/ellisonleao/glow.nvim/tree/main) y toda su documentación.
Para ejecutarlo basta con:

- `:Glow` Abre la vista previa del archivo actual.

- `:Glow path_file` Abre la vista previa del archivo indicado

- `<leader>gv` Es el map para abrir la vista previa del archivo actual.

#### Asistentes IA / Autocompletado

##### Codeium

Una buena alternativa a **GitHub Copilot**, permite autocompletado de codigo con IA, su [Github](https://github.com/Exafunction/codeium.vim)  y [Web](https://codeium.com/), require registro en su web para uso gratuito, tras instalar se debe utilizar:

```vim
:Codeim Auth
```

> Esto permite ingresar a la Web y generar un token para autenticación.

Al insertar escribir se generará automáticamente sugerencias que pueden completarse o aceptarse con tab.

###### Maps:

- `<C-]>` Limpiar

- `<M-]>` Siguiente sugerencia

- `<M-[>` Anterior sugerencia

- `<C-s>` Insertar sugenrecia o aceptarla, por defecto es `<Tab>`, pero entra en confilcto con el autocompletado

- `<M-Bslash>` (`Alt+\`)Activar manualmente la sugerencia

##### Tabnine

[Github](https://github.com/codota/tabnine-nvim) [Web](https://www.tabnine.com/) Otra opción

> Sin probar, actualmente estoy usando Codium, he dejado el archivo de instalación comentado

### Temas

Los temas se pueden consultar en https://vimcolorschemes.com/ y se define/configura en `core/plugins/colorscheme.lua`, actualmente uso **Tokyo Night moon**

1. **Tokyo Night**: [GitHub](https://github.com/folke/tokyonight.nvim?tab=readme-ov-file): Variantes `moon`, `night`, `storm`, `day` 
2. **Nord Vim:** [Vim Awesome](https://vimawesome.com/plugin/nord-vim) [GitHub](https://github.com/arcticicestudio/nord-vim)
3. Iceberg  
4. onedark
5. atom-dark
6. dracula
7. VimHybrid

## Solución de Errores

1. **redrawtime exceeded syntax highlighting disabled**:
   
   * Se puede instalar [Source-highlight](https://www.gnu.org/software/src-highlite/) *sudo apt install source-highlight*.
   
   * *:syn clear phpHereDoc*: Ejecutarlo támbien ayuda.
   
   * Agregar a la configuración de Vim *let g:loaded_matchparen = 1* incrementa la velocidad de carga de archivos PHP.
   
   * Por último funciona agregar a la configuración:
     
     ```bash
     set redrawtime=10000
     syntax sync fromstart
     set re=1
     ```

## Utilidades/Consejos

### Buscar

#### Texto dentro de ficheros

Cuando necesito buscar una cadena de texto en los archivos o directorio específico de manera repetitiva uso:

```vim
:grep -r -w "cadena a buscar" ruta/deseada/
```

> Después de ejecutarla puedo presionar `ENTER` y abrirá el primer archivo, o ejecutar `:copen` para el buffer con el listado e ir trabajando su apertura de cada archivo a gusto.
> 
> `-w` busca la cadena exacta w
> 
> `-o` permite incluir carácteres especiales que no se aplican con `-w`, por tanto se usa sin este último, por ejemplo _.cadena_ `:grep -ro ".cadena" ruta/`

#### Cadena de texto

- `?` `/` `:?` `:/`  Segido de la cadena a buscar
  
  > `\<cadena\>` Busca exactamente la cadena

- `*` Sobre el cursor

- Desplazamiento en los resultados:
  
  - `Ctrl+o` permite volver al origen de la busqueda
  
  - `n` `N` Moverse en resultado.

#### Reemplazar

- `:%s/cadena_origen/cadena_destino` Reemplazar todo en el documento.

- **Selección modo V**: después de tener seleccionado una ubicación se presiona `:`automáticamente command line inicia a `:'<,'>` esto indica que aplicará para la región seleccionanda y se prosigue a definir la cadena origen y la cadena reemplazo `:'<,'>s/cadena_origen/cadena_reemplazo`
  
  > Es muy practico porque podemos seleccionar varias líeas donde queremos aplicar ese reeemplazo, auque reemplazará solo una ocurrencia por linea, es necesario modificar las ocurrencias con `/g` por ejemplo.

- **Condicionles o modificadores:** Se agregan al final de la sentencia después de `/`
  
  - `g`: Repetir el reeemplazo varias ocurrencias, ejemplo `:'<,'>s/cadena_origen/cadena_reemplazo/g`
  
  - `c`: Interactivo, es decir, pide confirmación para reemplazar esa ocurrencia

- **Expresiones regulares**: Buscar y reemplazar permite utilizar tanto una cadena específica como expresiones reagulares, tanto para búsqueda como reemplazo, por ejemplo: reemplazar todas las `,` por `; más salto de líneas`, podemos usar la expresión regular `\r` para el salgo de línea
  
  ```vim
  :s/,/;\r/g
  ```

- **Con comandos**: buscar y ejecutar comandos, se usa en combinación con `g/` y su negación `g!/`
