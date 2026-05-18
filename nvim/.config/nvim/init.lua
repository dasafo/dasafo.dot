-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
    -- VS Code Neovim: Solo cargar opciones y keymaps básicos
    -- No cargamos 'config.lazy' a menos que quieras plugins específicos
    vim.opt.clipboard = "unnamedplus"
    -- Aquí puedes poner tus propios atajos de teclado para VS Code
    -- Desactivar animaciones que dan lag en VS Code
    vim.g.neovide_animations = false
else
    -- Neovim normal (Terminal)
    require("config.lazy")
end
