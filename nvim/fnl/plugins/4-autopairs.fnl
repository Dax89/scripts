(import-macros {: with-require-as} "macros")

(with-require-as ap nvim-autopairs
  (ap.setup { :check_ts true }))

; Configure with TreeSitter
(with-require-as tscfg nvim-treesitter.configs
  (tscfg.setup { :autopairs { :enable true }}))
