-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Explorador de archivos (Oil.nvim)
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Guardado rápido
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Para ver el historial de cambios de un archivo
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })

-- Salir del modo terminal con jj
vim.keymap.set("t", "ññ", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

--------------------------------------------------------------------------------
-- COMPILACIÓN Y EJECUCIÓN JAVA / JSP / MAVEN (ASÍNCRONO)
--------------------------------------------------------------------------------

-- Buscar el directorio del pom.xml desde el archivo actual hacia arriba
local function find_pom_dir()
  local dir = vim.fn.expand("%:p:h")
  while dir ~= "/" do
    local pom = dir .. "/pom.xml"
    if vim.fn.filereadable(pom) == 1 then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return nil
end

-- Función para ejecutar comandos Maven desde el directorio correcto
local function run_maven(cmd)
  local pom_dir = find_pom_dir()
  if not pom_dir then
    vim.notify("No se encontró pom.xml", vim.log.levels.ERROR)
    return
  end
  vim.cmd("vsplit | terminal cd \"" .. pom_dir .. "\" && " .. cmd)
end

-- Compilación universal con Maven
vim.keymap.set("n", "<leader>jc", function()
  run_maven("mvn clean compile")
end, { desc = "Maven: Clean & Compile" })

-- Ejecutar proyecto con Maven
vim.keymap.set("n", "<leader>rj", function()
  run_maven("mvn clean compile exec:java")
end, { desc = "Maven: Run Project" })

-- Atajos para despliegue en Tomcat vía Maven
vim.keymap.set("n", "<leader>md", function()
  run_maven("mvn tomcat7:deploy")
end, { desc = "Tomcat: Deploy" })
vim.keymap.set("n", "<leader>mr", function()
  run_maven("mvn tomcat7:redeploy")
end, { desc = "Tomcat: Redeploy" })
vim.keymap.set("n", "<leader>mu", function()
  run_maven("mvn tomcat7:undeploy")
end, { desc = "Tomcat: Undeploy" })

-- Abrir el archivo JSP o HTML actual en el navegador (ya usa jobstart, es asíncrono)
vim.keymap.set("n", "<leader>tb", function()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  local file_name = vim.fn.expand("%:t")
  local parent_dir = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
  local url = string.format("http://localhost:8080/%s/%s/%s", project_name, parent_dir, file_name)

  vim.notify("Abriendo: " .. url)
  vim.fn.jobstart({ "xdg-open", url })
end, { desc = "Tomcat: Open JSP/HTML in Browser" })
