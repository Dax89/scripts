(import-macros {: nv-opt : plugin-setup} "macros")

(nv-opt g
  :nvim_tree_update_cwd 1
  :nvim_tree_respect_buf_cwd 1)

(plugin-setup project_nvim setup)
