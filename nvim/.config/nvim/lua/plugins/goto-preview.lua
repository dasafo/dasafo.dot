return {
  "rmagatti/goto-preview",
  dependencies = { "rmagatti/logger.nvim" },
  -- Se carga al pulsar gp* en lugar de en cada BufEnter,
  -- evitando cargar telescope al arrancar nvim
  keys = {
{ "n", "gpd", desc = "Preview definition" },
{ "n", "gpt", desc = "Preview type definition" },
{ "n", "gpi", desc = "Preview implementation" },
{ "n", "gpD", desc = "Preview declaration" },
{ "n", "gpr", desc = "Preview references" },
{ "n", "gP", desc = "Close all preview windows" },
  },
  config = function()
    require("goto-preview").setup({
      width = 120,
      height = 15,
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
      default_mappings = false,
      opacity = nil,
      post_open_hook = nil,
      references = {
        provider = "telescope",
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
      },
      focus_on_open = true,
      dismiss_on_move = false,
      force_close = true,
      bufhidden = "wipe",
      stack_floating_preview_windows = true,
      preview_window_title = { enable = true, position = "left" },
    })

    -- Atajos gp*: preview en ventana flotante sin perder contexto
    vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { desc = "Preview definition" })
    vim.keymap.set("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { desc = "Preview type definition" })
    vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { desc = "Preview implementation" })
    vim.keymap.set("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { desc = "Preview declaration" })
    vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { desc = "Preview references" })
    vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", { desc = "Close all preview windows" })
  end,
}
