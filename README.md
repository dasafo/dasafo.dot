# ⚡ dasafo.dot

> **Personal development environment — terminal-first, keyboard-driven, battle-tested.**

A curated collection of dotfiles designed for a cohesive, high-velocity workflow across editors, terminals, and shell. Every config is optimized for minimal friction and maximum context preservation.

---

## 🧩 Components

| Component | Stack | Highlights |
|-----------|-------|------------|
| **Editor** | [Neovim](nvim/) + [LazyVim](https://www.lazyvim.org/) | LSP, DAP, Treesitter, session persistence |
| **Shell** | [Zsh](zsh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Instant prompt, gitstatus, fuzzy completion |
| **Terminal** | [Ghostty](ghostty/) / [Alacritty](alacritty/) | GPU-accelerated, true color, ligatures |
| **Multiplexer** | [Tmux](tmux/) + TPM | Session persistence, popups, project switcher |
| **Tooling** | FZF, Zoxide, Atuin, Eza | Fuzzy search, directory jumping, history sync |

---

## ✨ Features

### Neovim (`nvim/`)
- **LSP-first**: jdtls (Java), pyright (Python), lua_ls, TypeScript, Rust, Go — all auto-installed via Mason.
- **DAP**: Integrated debugger with Java test runner (`<leader>tt`, `<leader>tr`).
- **LazyVim extras**: luasnip, mini-surround, harpoon2, dial, plus language extras for Java, Python, Go, Rust, TypeScript, PHP, and more.
- **Session persistence** via `persistence.nvim`: restore exact buffers, splits, and cursor position with `<leader>qs`.
- **Java superpowers**: Extract method/variable/constant, organize imports, go to super implementation (`<leader>cx*`).

### Tmux (`tmux/`)
- **Session immortality** via `tmux-resurrect` + `tmux-continuum`: auto-saves every 15 minutes, restores on reboot.
- **Terminal popup** (`Prefix` + `g`): floating shell for quick commands without disrupting layout.
- **Project switcher** (`Prefix` + `f`): fuzzy-find and jump between any project in `~/Documents` with instant session creation.
- **Vim‑tmux navigator**: seamless `Ctrl+h/j/k/l` navigation across Neovim splits and Tmux panes.
- **Theme**: Tokyo Night via `tmux-powerkit` with true color support.
- **Mouse support**, vi copy mode, and window renumbering.

### Zsh (`zsh/`)
- **Instant prompt** with Powerlevel10k (no startup delay).
- **Zoxide** for smart `cd` — jump anywhere with `z <partial-path>`.
- **Atuin** for encrypted, cross-sync shell history.
- **FZF** integration with bat preview (`fzfbat`, `fzfnvim`).
- **Eza** as a modern `ls` replacement with icons, git status, and tree view.
- **Lazy‑loaded** Conda and NVM (no startup penalty).

### Ghostty (`ghostty/`)
- **GPU‑accelerated** with minimal latency.
- **Auto‑starts Tmux** with an independent session per window.
- **Transparency** (95% opacity) with Solarized Osaka Night theme.
- **No window decorations** for a clean, immersive look.

---

## 📁 Architecture

All configs are managed as plain files inside this repository and symlinked to their runtime locations using [GNU Stow](https://www.gnu.org/software/stow/).

```
dasafo.dot/
├── alacritty/     → ~/.config/alacritty/
├── ghostty/       → ~/.config/ghostty/
├── nvim/          → ~/.config/nvim/
├── tmux/          → ~/.tmux.conf  +  ~/dasafo.dot/tmux/scripts/
├── zsh/           → ~/.zshrc  +  ~/.p10k.zsh  +  ~/.fzf.zsh
└── README.md
```

---

## 🚀 Quick Install

### Prerequisites
- Git, Curl, a Package Manager (apt/brew/pacman)
- [GNU Stow](https://www.gnu.org/software/stow/)

### Steps

```bash
# 1. Clone
git clone https://github.com/dasafo/dasafo.dot.git ~/dasafo.dot
cd ~/dasafo.dot

# 2. Symlink everything with Stow
stow alacritty ghostty nvim tmux zsh

# 3. Install Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 4. Source scripts into PATH
#    The tmux-sessionizer script lives in dasafo.dot/tmux/scripts/.
#    Symlink it so Prefix+f works out of the box:
mkdir -p ~/.local/bin
ln -sf ~/dasafo.dot/tmux/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer

# 5. Open a new terminal, enter Neovim, and run :Lazy sync
#    Then in Tmux, press Prefix + I (capital i) to install plugins.
```

### Post‑install checklist

| What | How |
|------|-----|
| Install Neovim plugins | `nvim --headless "+Lazy! sync" +qa` |
| Install Tmux plugins | `tmux run '~/.tmux/plugins/tpm/scripts/install_plugins.sh'` |
| Install Mason packages | `nvim --headless "+MasonInstall jdtls java-debug-adapter java-test pyright" +qa` |

---

## ⌨️ Key Bindings Reference

### Tmux (Prefix = `Ctrl` + `a`)

| Binding | Action |
|---------|--------|
| `Prefix` + `c` | New window |
| `Prefix` + `\|` | Split vertical |
| `Prefix` + `-` | Split horizontal |
| `Prefix` + `Ctrl` + `s` | Save session (manual snapshot) |
| `Prefix` + `Ctrl` + `r` | Restore last saved session |
| `Prefix` + `g` | Open floating terminal popup |
| `Prefix` + `f` | Open project switcher (fzf) |
| `Alt` + `h/l` | Previous/next window |
| `Alt` + `j/k` | Previous/next session |

### Neovim (Leader = `Space`)

| Binding | Action |
|---------|--------|
| `<leader>ca` | Code actions (LSP) |
| `<leader>co` | Organize imports (Java) |
| `<leader>cx*` | Extract variable/constant/method (Java) |
| `<leader>qs` | Restore session (LazyVim persistence) |
| `<leader>tt` | Run all tests (Java) |
| `<leader>tr` | Run nearest test (Java) |
| `<leader>dc` | Debug continue / start |
| `<leader>rj` | Maven compile + exec |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |

---

## 📝 License

MIT — Use it, fork it, tweak it. If you steal the tmux popup and sessionizer, at least buy me a coffee ☕.

---

<p align="center">
  <sub>Built with caffeine, stubbornness, and an irrational love for the terminal.</sub>
</p>
