(import-macros {: nv-opt : nv-fn : with-require : with-require-as} "macros")

(nv-opt g
        :completion_matching_strategy_list ["exact" "fuzzy"]
        :completion_matching_smart_case true
        nil)

(vim.api.nvim_set_keymap "i" "<Tab>" "compe#complete()" {:noremap false :silent true :expr true})

; Compe
(with-require compe
  (compe.setup {
    :enabled true
    :autocomplete true
    :debug false
    :min_length 1
    :preselect "enable"
    :throttle_time 80
    :source_timeout 200
    :incomplete_delay 400
    :max_abbr_width 100
    :max_kind_width 100
    :max_menu_width 100
    :documentation true

    :source {
      :path true
      ;:buffer true
      :calc true
      :nvim_lsp true
      :nvim_lua true
      :vsnip false
      :ultisnips true
      :conjure true
    }
}))

; Custom LSP Callbacks
(fn setup-lsp-sumneko_lua [server]
  {
   :settings {
      :Lua {
        :diagnostics {
          :globals ["vim"] ; Get the language server to recognize the `vim` global
        }
      }
    }
  })

; LSPInstaller
(fn setup-servers []
  (local lspinstall (require :nvim-lsp-installer))
  (lspinstall.on_server_ready (fn [server]
                                (var opts { })

                                (match server.name
                                  "sumneko_lua" (set opts (setup-lsp-sumneko_lua)))

                                (server:setup opts))))

(setup-servers)

