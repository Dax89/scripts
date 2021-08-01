;(local neorgconfig {
;  :core.defaults { }       ; Load all the default modules
;  :core.norg.concealer { } ; Allows for use of icons
;  :core.norg.dirman {      ; Manage your directories with Neorg
;    :config { :workspaces { :my_workspace "~/.neorg"}} }})

;(local neorgtsconfig {
;  :install_info {
;    :url "https://github.com/vhyrro/tree-sitter-norg"
;    :files [ "src/parser.c"]
;    :branch "main"
;  }})

;((. (require "neorg") :setup) { :load neorgconfig })

;(let [configs (require "nvim-treesitter.parsers")]
;  (tset (configs.get_parser_configs) :norg neorgtsconfig))
