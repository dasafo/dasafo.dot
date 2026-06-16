🧠 El Ciclo de Vida de tu Entorno

GUARDAR
- Automático: no hacés nada. Tmux guarda una copia de todo cada 15 minutos (tmux-continuum).
- Manual (opcional): Ctrl+a + Ctrl+s → ves el mensaje "Tmux environment saved".

SALIR
- Podés cerrar Ghostty sin miedo. Tmux queda vivo en el fondo.
- O si querés matar TODO: desde cualquier terminal tmux kill-server (solo cuando estés seguro).

VOLVER
1. Abrí Ghostty → Tmux revive automáticamente.
2. Si ves la pantalla sucia o congelada → Ctrl+l para limpiar.
3. Ctrl+a + Ctrl+r → Resucitan tus paneles, ventanas y carpetas exactas.
4. Abrí Neovim: nvim.
5. <leader>qs → LazyVim te devuelve los archivos exactos donde estabas.

SALTAR DE PROYECTO
- Ctrl+a + f → Buscador fzf, elegís proyecto y cambiás de canal.
- Para volver al proyecto anterior: Ctrl+a + f de nuevo y lo buscás.
- Si querés ver DOS proyectos al mismo tiempo: abrí una segunda ventana física de Ghostty (Ctrl+Shift+N) y sintonizá el otro proyecto ahí.

Comandos clave de un vistazo:
Acción	Atajo
Guardar estado Tmux	Ctrl+a → Ctrl+s
Restaurar estado Tmux	Ctrl+a → Ctrl+r
Recuperar archivos de Neovim	<leader>qs
Limpiar pantalla	Ctrl+l
Popup flotante	Ctrl+a → g
Sessionizer (saltar proyecto)	Ctrl+a → f
Nueva ventana Tmux	Ctrl+a → c
Dividir vertical	Ctrl+a → |
Dividir horizontal	Ctrl+a → -

Esa es tu base operativa ahora. ¿Vas a probar el ciclo completo? Guardá con Ctrl+a + Ctrl+s, cerrá todo, abrí Ghostty de nuevo, restaura con Ctrl+a + Ctrl+r, abrí Neovim y  <leader>qs. ¡Te tiene que devolver todo exacto!
