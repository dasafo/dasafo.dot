return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        -- Acá va tu ASCII art. Reemplazá este header con el de tu imagen.
        -- Cada string es una línea. Ejemplo:
        -- header = {
        --   [[  ██████  ]],
        --   [[ ██  ████ ]],
        --   [[dasafo.dot]],
        -- },
        header = {
          "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
          "       ~/.config/nvim - dasafo.dot",
          "",
        },
        shortcut = {
          { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
          { desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
          { desc = " Grep", group = "DiagnosticHint", action = "Telescope live_grep", key = "g" },
          { desc = "󰤯 Recent files", group = "Number", action = "Telescope oldfiles", key = "r" },
        },
        packages = { enable = true },
        project = { enable = true, limit = 8 },
        mru = { enable = true, limit = 10, cwd_only = false },
      },
    })
  end,
}
