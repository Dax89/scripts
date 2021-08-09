(macro plugin-setup [name func]
  `(let [p# (require ,(tostring name))]
    (. p# ,func)))

(plugin-setup colorizer setup)
(plugin-setup trouble setup)
(plugin-setup lspkind init)
