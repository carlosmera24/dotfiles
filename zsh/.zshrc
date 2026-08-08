# ========================================
# FUNCIONES PERSONALIZADAS
# ========================================
exports_linux() {
    # Keyboard layouts
    export KEYBOARD_LAYOUT=es
    # Created by `pipx` on 2025-09-13 18:06:32
    export PATH="$PATH:/home/carlos/.local/bin"
}
exports_macos() {
    # Keyboard layouts
    export LANG=en_US.UTF-8
    # PHP
    export PATH="/opt/homebrew/opt/php/bin:$PATH"
    # ADB Android Brew 
    export PATH="/opt/homebrew/bin/adb:$PATH"
    # Added by LM Studio CLI (lms)
    export PATH="$PATH:/Users/carlos/.lmstudio/bin"
    # Created by `pipx` on 2025-12-10 19:31:16
    export PATH="$PATH:/Users/carlos/.local/bin"
    export PATH="/opt/homebrew/opt/apr/bin:$PATH"
    export PATH="/opt/homebrew/opt/apr-util/bin:$PATH"
    # Lazygit y otras aplicaciones, buscará la configuración en .config
    export XDG_CONFIG_HOME=$HOME/.config
}
alias_macos() {
    eval $(ssh-agent)

    # MarkText y habilitar autocompletado
    alias marktext="/Applications/MarkText.app/Contents/MacOS/MarkText"
    _marktext_complete() {
    local words
    words=("marktext")
    _describe 'command' words
    }
    compdef _marktext_complete marktext

    # Firefox Developer Edition y habilitar autocompletado
    alias firefox-developer-edition="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox"
    _firefox_developer_edition_complete() {
    local words
    words=("firefox-developer-edition")
    _describe 'command' words
    }
    compdef _firefox_developer_edition_complete firefox-developer-edition
    BROWSER="/Applications/Firefox Developer Edition.app/"

    #Emulator from Android SDK
    alias emulator="/Users/carlos/Library/Android/sdk/emulator/emulator"
    _emulator_android_sdk_complete() {
        local words
        words=("emulator")
        _describe 'command' words
    }
    compdef _emulator_android_sdk_complete emulator

    #Fastfetch
    alias fastfetch="/usr/local/Cellar/fastfetch/2.25.0/bin/fastfetch"
    _fastfetch_complete() {
        local words
        words=("fastfetch")
        _describe 'command' words
    }
    compdef _fastfetch_complete fastfetch

    #Zettlr
    alias zettlr="/Applications/Zettlr.app/Contents/MacOS/Zettlr"
    _fastfetch_complete() {
        local words
        words=("zettlr")
        _describe 'command' words
    }
    compdef _zettlr_complete zettlr
}
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

# ========================================
# VARIABLES DE ENTORNO
# ========================================
# Editor por defecto
export EDITOR=nvim
case "$(uname -s)" in
    Darwin)
        exports_macos
        ;;
    Linux)
        exports_linux
        ;;
esac

# Variables de entorno desde envchain
export GEMINI_API_KEY="$(envchain apis printenv GEMINI_API_KEY)"

# ========================================
# PLUGINS - FRAMEWORKS
# ========================================
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# ========================================

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

# ========================================
# INICIALIZACIÓN DE HERRAMIENTAS
# ========================================
# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# zoxide
eval "$(zoxide init zsh)"

# grep color
alias grep='grep --color=auto'

case "$(uname -s)" in
    Darwin)
        alias_macos
        ;;
    Linux)
        # TODO
        ;;
esac
# ========================================
