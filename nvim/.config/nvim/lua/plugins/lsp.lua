return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- LazyVim ya configura pyright y jdtls gracias a tus extras.
      -- Solo añadimos configuraciones personalizadas si es estrictamente necesario.
      lua_ls = {
        settings = {
          Lua = {
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
          },
        },
      },
      lemminx = {},
    },
  },
}
