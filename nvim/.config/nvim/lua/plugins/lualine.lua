return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      globalstatus = true,
      theme = "auto", -- Sincronización automática con Solarized Osaka
    },
    sections = {
      lualine_c = { { "filename", file_status = true, path = 1 } },
      lualine_x = {
        {
          function() return require("lazy.status").updates() end,
          cond = function() return require("lazy.status").has_updates() end,
          color = { fg = "#ff9e64" },
        },
      },
    },
    winbar = {
      lualine_c = {
        {
          function()
            local folder = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
            local file = vim.fn.expand("%:t")
            return folder .. "/" .. file
          end,
        },
      },
    },
    inactive_winbar = {
      lualine_c = {
        {
          function()
            local folder = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
            local file = vim.fn.expand("%:t")
            return folder .. "/" .. file
          end,
          color = { fg = "#808080" },
        },
      },
    },
  },
}
