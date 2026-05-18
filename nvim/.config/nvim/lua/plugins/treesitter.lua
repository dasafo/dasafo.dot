return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Añadimos solo los lenguajes que NO están cubiertos por tus extras de LazyVim
    vim.list_extend(opts.ensure_installed, {
      "csv",
      "xml",
      "regex",
    })
  end,
}
