# Setup fzf
# ---------
if [[ ! "$PATH" == */home/david/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/david/.fzf/bin"
fi

# Carga de completados y atajos nativos
source <(fzf --zsh)

# ==============================================================================
# MEJORAS PERSONALIZADAS
# ==============================================================================

# 1. Optimización del motor de búsqueda (Usa 'fd' en lugar de 'find')
# Ignora automáticamente archivos en .git, ocultos innecesarios y respeta tu .gitignore
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --exclude .git'
fi

# 2. Comportamiento y Estética (Match con paleta Kanagawa)
# --height 40%: Abre el buscador en formato menú abajo sin romper tu vista de terminal
# --layout=reverse: Pone la barra de búsqueda arriba del menú interactivo
export FZF_DEFAULT_OPTS="
  --height 40% 
  --layout=reverse 
  --border 
  --color=fg:#dcd7ba,bg:#1f1f28,hl:#c0a36e 
  --color=fg+:#dcd7ba,bg+:#2a2a37,hl+:#e6c384 
  --color=info:#7aa89f,prompt:#7e9cd8,pointer:#957fb8 
  --color=marker:#98bb6c,spinner:#957fb8,header:#7e9cd8"
