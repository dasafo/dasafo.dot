return {
  {
    "JavaHello/spring-boot.nvim",
    dependencies = {
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      -- Esto engancha el LSP de Spring a tu proyecto
      require("spring_boot").setup()
    end,
  },
}