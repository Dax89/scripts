(macro plugin-setup [name func]
  `(let [p# (require ,name)]
    (. p# ,func)))

(plugin-setup :colorizer setup)
(plugin-setup :trouble setup)
(plugin-setup :lspkind init)
