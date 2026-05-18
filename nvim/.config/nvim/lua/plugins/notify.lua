---@diagnostic disable: missing-fields
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    timeout = 3000,
    -- El código hexadecimal de 8 posiciones (8 ceros) fuerza la transparencia total
    background_colour = "#00000000",
    render = "compact",
    stages = "static", -- Recomendado para evitar lag en terminales sin composición
  },
}
