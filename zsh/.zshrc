# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
FUNCNEST=5000
bindkey -v
setopt autocd beep extendedglob nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/carlos/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#------- Enable history search with arrow keys
# Bindings main keymap (emacs) - arrow keys
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Bindings vi mode 
bindkey -M vicmd 'j' history-beginning-search-backward
bindkey -M vicmd 'k' history-beginning-search-forward
#------- Enable history search with arrow keys

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# zoxide
eval "$(zoxide init zsh)"

# Editor por defecto
export EDITOR=nvim
# Keyboard layouts
export KEYBOARD_LAYOUT=es

# Gemini API Key
export GEMINI_API_KEY=AIzaSyCgVFzhPNLAV7ZYbQjfWy1uGBEp6RcobPg

# Created by `pipx` on 2025-09-13 18:06:32
export PATH="$PATH:/home/carlos/.local/bin"

