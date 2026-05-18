return {
  -- 1. Quitar los errores (Linter)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {}, -- Desactiva markdownlint
      },
    },
  },

  -- 2. Quitar el fondo azul (UI)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        -- backgrounds = {}, -- Quita el fondo de los títulos
        -- Define los grupos de fondo para cada nivel (H1, H2, etc.)
        -- El plugin usa por defecto estos grupos si no los sobrescribes
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
      },
      code = {
         highlight = "Normal", -- Quita el fondo de los bloques de código
        -- highlight = "RenderMarkdownCode",
        -- Cambia "Normal" por el grupo de resaltado para bloques de código
        -- "RenderMarkdownCode" es el valor por defecto del plugin 
        -- Si quieres un fondo grisáceo estándar del editor, puedes probar "ColorColumn"
      },
    },
  },
}
