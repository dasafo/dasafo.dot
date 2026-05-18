--return {
--  "wuelnerdotexe/vim-enfocado",
--  lazy = false, -- make sure we load this during startup if it is your main colorscheme
--  priority = 1000, -- make sure to load this before all the other start plugins
--  transparent = true,
--  config = function()
--    -- load the colorscheme here
--    vim.cmd([[colorscheme enfocado]])
--  end,
--}

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   lazy = false,
--   opts = {
--     flavour = "latte",
--     transparent_background = true, -- disables setting the background color.
--   },
-- }

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

--return {
--  "folke/tokyonight.nvim",
--  opts = {
--    transparent = true,
--    styles = {
--      sidebars = "transparent",
--      floats = "transparent",
--    },
--  },
--}
