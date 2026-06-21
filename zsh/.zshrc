# ==============================================================================
# 0. AUTO-START TMUX (DEBE IR ANTES DE P10K)
# ==============================================================================
# Lanzamos tmux antes de que p10k secuestre la terminal
if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && command -v tmux &> /dev/null; then
  exec tmux
fi

# ==============================================================================
# 1. OPTIMIZACIÓN DE ARRANQUE (Powerlevel10k Instant Prompt)
# ==============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Evitar duplicados en el PATH
typeset -U path

# Carga rápida de completados (Solo una vez al día)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

# ==============================================================================
# (El bloque de Tmux fue movido al principio del archivo)
# ==============================================================================

# Evitar duplicados en el PATH
typeset -U path


# ==============================================================================
# 2. ENTORNO Y PATHS BASE (Estáticos, sin llamadas a shell)
# ==============================================================================
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.npm-global/bin:/opt/docker-desktop/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.cargo/bin:$PATH"

# Variables de Editor por defecto
export EDITOR="nvim"
export VISUAL="nvim"

# ==============================================================================
# 3. HOMEBREW (Optimizado sin llamadas a 'eval')
# ==============================================================================
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info${INFOPATH+:$INFOPATH}"

# ==============================================================================
# 4. CONDA (Carga Perezosa - Lazy Load)
# ==============================================================================
conda() {
  unset -f conda
  if [ -f "/home/david/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/home/david/anaconda3/etc/profile.d/conda.sh"
    conda $@
  fi
}

# ==============================================================================
# 5. OH MY ZSH & PLUGINS
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" 
zstyle ':omz:update' mode disabled # Desactivar check de updates en el login
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ==============================================================================
# 6. NVM (Carga Perezosa)
# ==============================================================================
export NVM_DIR="$HOME/.nvm"
lazy_nvm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { lazy_nvm; nvm $@ }
node() { lazy_nvm; node $@ }
npm() { lazy_nvm; npm $@ }

# ==============================================================================
# 7. EXTRAS & CONFIGURACIONES DE TERCEROS
# ==============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/home/david/google-cloud-sdk/path.zsh.inc" ] && source "/home/david/google-cloud-sdk/path.zsh.inc"
[ -f "/home/david/google-cloud-sdk/completion.zsh.inc" ] && source "/home/david/google-cloud-sdk/completion.zsh.inc"

# Engram Cloud Configuration
export ENGRAM_CLOUD_TOKEN="Freedom85"
export ENGRAM_CLOUD_ADMIN="elPutoAmo"
export ENGRAM_CLOUD_AUTOSYNC="1"
export ENGRAM_CLOUD_SERVER="https://engram.dasafodata.com"

# Aliases
alias restartvenv='deactivate 2>/dev/null; source .venv/bin/activate'
alias ls='ls --color=auto'

# Maven / Spring Boot aliases
unalias mvnw 2>/dev/null
mvnw() {
  if [ -f "./mvnw" ]; then
    ./mvnw "$@"
  else
    command mvn "$@"
  fi
}
alias spring-dev='mvnw spring-boot:run -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"'

# Aliases de búsqueda y previsualización interactiva
alias fzfbat='fzf --preview="batcat --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="batcat --color=always {}")'

# Reemplazo de ls por eza en formato Tabla tipo Nushell
if command -v eza &> /dev/null; then
  alias ls='eza --long --header --icons --git --binary --group-directories-first'
  alias ll='eza --long --header --icons --git --all --binary --group-directories-first'
else
  alias ls='ls --color=auto'
fi

# ==============================================================================
# 8. MODERN CLI TOOLS INITIALIZATION (Zoxide & Atuin)
# ==============================================================================
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v atuin &> /dev/null; then
  eval "$(atuin init zsh)"
fi

# ==============================================================================
# 9. CARGA DEL PROMPT (Debe ir al final)
# ==============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Added by Antigravity CLI installer
export PATH="/home/david/.local/bin:$PATH"
