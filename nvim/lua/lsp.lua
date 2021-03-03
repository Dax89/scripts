-- Javascript/TypeScript: https://github.com/theia-ide/typescript-language-server
-- C/C++: https://clangd.llvm.org/installation.html (CLang >= 9 required)
-- Python: https://github.com/palantir/python-language-server
-- Lua: https://github.com/sumneko/lua-language-server

local completion = require('completion')
local lsp = require('lspconfig')

vim.g.completion_matching_strategy_list = { 'exact', 'fuzzy' }
vim.g.completion_matching_smart_case = true

vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

lsp.tsserver.setup{ on_attach = completion.on_attach }
lsp.clangd.setup{ on_attach = completion.on_attach }
lsp.pyls.setup{ on_attach = completion.on_attach }

lsp.sumneko_lua.setup{
  cmd = { "/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
  on_attach=completion.on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        path = vim.split(package.path, ';'), -- Setup your lua path
      },
      diagnostics = {
        globals = {'vim', 'use'}, -- Get the language server to recognize the `vim` global
      },
      workspace = {
        library = { -- Make the server aware of Neovim runtime files
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  }
}

