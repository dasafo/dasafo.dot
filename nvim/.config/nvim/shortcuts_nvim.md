Esta es la lista completa y actualizada de los atajos de teclado configurados en tu Neovim, divididos por categorías para que sea más fácil de consultar.

### 🛠️ Atajos Generales y de Sistema

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>w` | **Guardar archivo** | Ejecuta `:w` para guardar el buffer actual. |
| `-` | **Abrir Oil.nvim** | Abre el explorador de archivos Oil en el directorio padre del archivo actual. |
| `ññ` | **Salir de Terminal** | En modo Terminal, vuelve al modo Normal. Lo mapeamos a `ññ` porque `<Esc>` solo va a Terminal-Normal, no a Normal. |

---

### ☕ Desarrollo en Java y Maven (Tomcat)

Estos atajos están optimizados para tus proyectos Spring y Hibernate con Maven.

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>jc` | **Maven Compile** | Ejecuta `mvn clean compile` para limpiar y compilar el proyecto. |
| `<leader>rj` | **Maven Run** | Compila y ejecuta el proyecto usando `exec:java`. |
| `<leader>md` | **Tomcat Deploy** | Despliega la aplicación en Tomcat mediante Maven. |
| `<leader>mr` | **Tomcat Redeploy** | Realiza un re-despliegue en caliente en Tomcat. |
| `<leader>mu` | **Tomcat Undeploy** | Retira la aplicación desplegada de Tomcat. |
| `<leader>tb` | **Abrir en Navegador (Tomcat)** | Detecta automáticamente la URL del proyecto y abre el JSP/HTML en el navegador. |

---

### 🔍 Búsqueda y Navegación (Telescope)

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>rp` | **Buscar Plugins** | Busca archivos dentro de tu carpeta de configuración de plugins. |
| `<leader>bb` | **File Browser** | Abre el explorador de archivos avanzado de Telescope en la ruta actual. |
| `<leader>ff` | **Buscar Archivos** | (Default LazyVim) Buscador rápido de archivos en el proyecto actual. |
| `<leader>sg` | **Live Grep** | (Default LazyVim) Busca texto dentro de todos los archivos del proyecto. |

---

### 📜 Historial y Edición (Undotree & Otros)


*El árbol de Undotree permite navegar por estados del archivo que en editores normales se perderían al sobrescribir el historial de "deshacer".*

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>ut` | **Toggle Undotree** | Abre/Cierra el panel lateral con el árbol cronológico de cambios (si añadiste el mapeo sugerido). |
| `ys` + mov | **Add Surround** | (Mini.surround) Añade paréntesis/comillas. Ejemplo: `ysiw"` rodea una palabra con comillas. |
| `cs` | **Change Surround** | (Mini.surround) Cambia un envoltorio por otro. Ejemplo: `cs"'` cambia comillas dobles a simples. |
| `ds` | **Delete Surround** | (Mini.surround) Elimina el envoltorio (paréntesis, llaves, etc.). |

---

### 🚀 Navegación de Código (LSP)

Gracias a que limpiamos el archivo `lsp.lua`, ahora usas los atajos estándar de LazyVim que son mucho más potentes.

* `gd`: **Ir a definición** (abre el archivo donde se define la función/variable).
* `gr`: **Ver referencias** (abre una lista con todos los lugares donde se usa).
* `K`: **Documentación** (muestra la información de la función/clase bajo el cursor).
* `<leader>cr`: **Cambiar nombre** (Rename) en todo el proyecto.
* `<leader>ca`: **Code Actions** (sugiere correcciones rápidas para errores de código).

