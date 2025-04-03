# TMUX

[tmux](https://github.com/tmux/tmux/wiki) es una terminal multiplexer, de esa manera permite tener en ejecución diferentes instancias dentro de una sola sesión, es decir, en cualqueir terminal del sistema se puede invocar el comando tmux para crear una nueva sessión y dentro de ella llamar o correr servicios en segundo plano y todo desde una sola sesión, de tal manera que se pueda navegar por los servicios adjuntos como sesiones, ventanas o paneles.

## Instalación

### Linux

En `ArchLinux` se puede instalar con pacman.

```shell
sudo pacman -S tmux
```

### MacOs

Instalar bajo `HomeBrew`

```shell
brew install tmux
```

Se pude verificar la versión con el comando `tmux -V`

## Funcionalidades

### Prefix Key

Por defecto, tmux tiene definido el comando `Ctrl+b`, de esta manera se interactua con los atajos de teclado de tmux, para esta documentación usaré la abreviación `prefixKey`. La lista de atajos de teclado o conbinaciones se pueden listar con `Ctrl+b+?`

### Sesiones

1. Iniciar nueva sesión
   
   ```shell
   tmux new -s nombre_sesion
   ```

2. Listar sesiones activas
   
   ```shell
   tmux ls
   ```

3. Conectar a una sesión existente
   
   ```shell
   tmux attach -t nombre_sesion
   ```

4. Desconectar sesión sin cerrarla: `prefixKey+d`, la sesión se cierra pero sigue abierta, se puede listar y unirse a ella.

5. Cerrar sesión:
   
   ```shell
   tmux kill-session -t nombre_sesion
   ```

### Ventanas

1. Crear nueva ventana: `prefixKey+c`

2. Cambiar entre ventanas:
   
   - Siguiente: `prefixKey+n`
   
   - Anterior: `prefixKey+p`
   
   - Ir a una ventana: `prefixKey+[numero]`

3. Cerrar ventana: Basta con salir de esa terminal (ventana) abierta usando el comando `exit` o `Ctrl+d`

### Paneles

1. Dividir paneles:
   
   - Verticalmente: `prefixKey+%`
   
   - Horizontalmente: `prefixKey+""`

2. Moverse entre paneles:
   
   - Siguiente: `prefixKey+o`
   
   - Anterior: `prefixKey+[flechas dirección]`

3. Redimensionar: `prefixKey+(Alt+[flechas dirección])`

4. Cerrar: `prefixKey+x` y confirmar

## Configuración

Tmux usa el archivo de configuración `~/.tmux.conf`

> TODO Agregar tema
