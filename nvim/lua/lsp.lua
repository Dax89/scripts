local completion = require("completion")

vim.g.completion_matching_strategy_list = { "exact", "fuzzy" }
vim.g.completion_matching_smart_case = true

vim.api.nvim_set_keymap("i", "<S-Tab>", "pumvisible() ? '\\<C-p>' : '\\<Tab>'", {expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? '\\<C-n>' : '\\<Tab>'", {expr = true})

-- Based On: https://github.com/kabouzeid/nvim-lspinstall/wiki
-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";"),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {"vim"},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      },
    },
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    capabilities = capabilities, -- enable snippet support
    on_attach = completion.on_attach -- map buffer local keybindings when the language server attaches
  }
end

-- lsp-install
local function setup_servers()
  require("lspinstall").setup()

  -- get all installed servers
  local servers = require("lspinstall").installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end

    require("lspconfig")[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don"t have to restart neovim
require("lspinstall").post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
