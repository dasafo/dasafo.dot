return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  -- Extendemos la configuración base de LazyVim
  opts = function(_, opts)
    -- Configuramos las extensiones dentro de la tabla opts
    opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      file_browser = {
        theme = "ivy",
        hijack_netrw = false,
      },
    })
  end,
  -- Cargamos las extensiones manualmente después de que Telescope se inicie
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
  keys = {
    -- Búsqueda personalizada en tu carpeta de plugins
    {
      "<leader>rp",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Plugins",
          cwd = "~/.config/nvim/lua/plugins",
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            map("i", "<c-y>", function(prompt_bufnr)
              local new_plugin = action_state.get_current_line()
              actions.close(prompt_bufnr)
              vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
            end)
            return true
          end,
        })
      end,
      desc = "Buscar archivos de Plugins",
    },
    -- Atajo para tu File Browser personalizado
    {
      "<leader>bb",
      function()
        require("telescope").extensions.file_browser.file_browser({
          path = "%:h:p",
          select_buffer = true,
        })
      end,
      desc = "Telescope file browser",
    },
  },
}
