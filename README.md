# 🚀 dasafo.dot (Dotfiles)

¡Bienvenido a mi repositorio de dotfiles! Aquí guardo las configuraciones de mi entorno de desarrollo para poder replicarlo fácilmente en cualquier máquina.

## 🛠️ Herramientas y Configuraciones

- **[Neovim](nvim/.config/nvim/)**: Mi editor principal, basado en la estructura de LazyVim, pero personalizado para mi flujo de trabajo.
- **[Zsh](zsh/)**: Configuración de mi shell (`.zshrc`).
- **[Powerlevel10k](zsh/)**: Tema rápido y altamente informativo para Zsh (`.p10k.zsh`).
- **[FZF](zsh/)**: Buscador difuso (fuzzy finder) para la terminal (`.fzf.zsh`).
- **[Alacritty](alacritty/.config/alacritty/)**: Emulador de terminal acelerado por GPU (`alacritty.toml`).
- **[Tmux](tmux/)**: Multiplexador de terminal (`.tmux.conf`).

## ⚙️ Arquitectura

Este repositorio está diseñado para ser utilizado con **[GNU Stow](https://www.gnu.org/software/stow/)**, un gestor de enlaces simbólicos (symlinks). 

Esto permite mantener los archivos reales centralizados en este repositorio y simplemente enlazarlos a sus ubicaciones correctas en el sistema operativo (por ejemplo, `~/.config/nvim` o `~/.zshrc`).

```text
dasafo.dot/
├── alacritty/ # Configuración de la terminal (va en ~/.config/alacritty)
├── nvim/      # Configuración de Neovim (va en ~/.config/nvim)
├── tmux/      # Configuración de Tmux (va en ~/)
├── zsh/       # Archivos de configuración de la shell (van en ~/)
└── README.md
```

## 🚀 Instalación en una máquina nueva

1. Clona este repositorio en tu directorio home:
   ```bash
   git clone https://github.com/dasafo/dasafo.dot.git ~/dasafo.dot
   ```

2. Instala **GNU Stow** (ejemplo en Ubuntu/Debian):
   ```bash
   sudo apt update && sudo apt install stow
   ```

3. Entra al directorio y usa stow para crear los enlaces simbólicos automáticamente:
   ```bash
   cd ~/dasafo.dot
   stow zsh
   stow nvim
   stow alacritty
   stow tmux
   ```

---
*Hecho con ☕ y código.*