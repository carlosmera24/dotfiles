# ========================================
# CONFIGURACIÓN
# ========================================
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
FUNCNEST=5000 # Increase the limit of nested function calls
bindkey -v
setopt autocd beep extendedglob nomatch notify

# ========================================
# VARIABLES DE ENTORNO
# ========================================
# Editor por defecto
export EDITOR=nvim
# Keyboard layouts
export KEYBOARD_LAYOUT=es
# Created by `pipx` on 2025-09-13 18:06:32
export PATH="$PATH:/home/carlos/.local/bin"
# Variables de entorno desde envchain
export GEMINI_API_KEY="$(envchain apis printenv GEMINI_API_KEY)"

# ========================================
# PLUGINS - FRAMEWORKS
# ========================================
zstyle :compinstall filename '/home/carlos/.zshrc'
autoload -Uz compinit
compinit

# ========================================
# BINDINGS
# ========================================
#------- Enable history search with arrow keys
# Bindings main keymap (emacs) - arrow keys
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Bindings vi mode 
bindkey -M vicmd 'j' history-beginning-search-backward
bindkey -M vicmd 'k' history-beginning-search-forward
#------- Enable history search with arrow keys

# ========================================
# INICIALIZACIÓN DE HERRAMIENTAS
# ========================================
# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# zoxide
eval "$(zoxide init zsh)"
