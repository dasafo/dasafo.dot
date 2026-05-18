-- Colorscheme: Solarized Osaka
-- Si querés cambiar, comentá este bloque y descomentá otro abajo

return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd("colorscheme solarized-osaka")
    end,
  },
}

-- Alternativas (descomentar para usar):
-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     lazy = false,
--     opts = { flavour = "latte", transparent_background = true },
--   },
-- }
--
-- return {
--   {
--     "folke/tokyonight.nvim",
--     opts = { transparent = true, styles = { sidebars = "transparent", floats = "transparent" } },
--   },
-- }
