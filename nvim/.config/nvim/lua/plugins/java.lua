return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local mason_registry = require("mason-registry")
      local jdtls_pkg = mason_registry.get_package("jdtls")
      local jdtls_path = jdtls_pkg:get_install_path()
      local lombok_jar = jdtls_path .. "/lombok.jar"
      local cmd_path = jdtls_path .. "/bin/jdtls"
      
      -- Forzamos la ruta absoluta al ejecutable y lombok
      opts.cmd = {
        cmd_path,
        "--jvm-arg=-javaagent:" .. lombok_jar
      }
    end,
  },
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