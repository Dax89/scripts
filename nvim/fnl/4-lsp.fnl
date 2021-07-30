(tset vim.g :completion_matching_strategy_list ["exact" "fuzzy"])
(tset vim.g :completion_matching_smart_case true)
(vim.api.nvim_set_keymap "i" "<C-Space>" "compe#complete()" {:noremap false :silent true :expr true})

(fn load-lspconfig [name command installcommands]
  (local lspconfig (require :lspconfig))
  (local config (. (. lspconfig name) :document_config))

  (let [lspcfg (require "lspconfig/configs")]
    (tset lspcfg name nil))

  (tset config.default_config.cmd 1 command)

  (let [lspservers (require "lspinstall/servers")]
    (tset lspservers name (vim.tbl_extend "error" config { :install_script installcommands :uninstall_script nil }))))


; Based On: https://github.com/kabouzeid/nvim-lspinstall/wiki

; Configure lua language server for neovim development
(local luasettings {
  :Lua {
    :runtime {
      ; LuaJIT in the case of Neovim
      :version "LuaJIT"
      :path (vim.split package.path  ";")
    }
    :diagnostics {
      ; Get the language server to recognize the `vim` global
      :globals ["vim"]
    }
    :workspace {
      ; Make the server aware of Neovim runtime files
      :library {
        (vim.fn.expand "$VIMRUNTIME/lua") true
        (vim.fn.expand "$VIMRUNTIME/lua/vim/lsp") true
      }
    }
  }
})

; config that activates keymaps and enables snippet support
(fn make-config [ ]
    (local capabilities (vim.lsp.protocol.make_client_capabilities))
    (tset capabilities :textDocument.completion.completionItem.snippetSupport true)
    {:capabilities capabilities}) ; enable snippet support


; Compe
(let [compe (require :compe)]
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
      :buffer true
      :calc true
      :nvim_lsp true
      :nvim_lua true
      :vsnip false
      :ultisnips true
      :conjure true
    }
}))

; LSPInstall
(fn setup-servers []
  (local lspinstall (require :lspinstall))
  (lspinstall:setup)
  (local servers (lspinstall:installed_servers))

  ; Add manually installed servers
  (table.insert servers "nimls")
  (table.insert servers "zls")

  (each [_ server (pairs servers)]
    (local config (make-config))

    ; Language specific config
    (when (= server "lua")
      (tset config :settings luasettings))
    
    (let [lspconfig (require :lspconfig)]
      ((. (. lspconfig server) :setup) config))))

(setup-servers)

; Automatically reload after `:LspInstall <server>` so we don"t have to restart neovim
(let [lspinstall (require :lspinstall)]
  (tset lspinstall :post_install_hook (lambda []
                                        (setup-servers)
                                        (vim.cmd "bufdo e"))))
