-- Options are automatically loaded before lazy.nvim startup
-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Configuración de línea y visualización
vim.opt.wrap = true          -- Ajuste de línea activado
vim.opt.linebreak = true     -- No cortar palabras a la mitad al ajustar
vim.opt.colorcolumn = "0"    -- Desactivar la columna de color
vim.opt.numberwidth = 2      -- Un poco más de margen para los números (recomendado: 2-4)

-- Columnas de estado
vim.opt.signcolumn = "yes"   -- Mantener siempre la columna de signos (Git/LSP)
vim.opt.foldcolumn = "0"     -- Mantener la columna de pliegues oculta

-- Transparencia en ventanas flotantes y menús
vim.opt.winblend = 0         -- Transparencia en ventanas flotantes
vim.opt.pumblend = 0         -- Transparencia en el menú de autocompletado (popup menu)
