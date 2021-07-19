-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
DATA_PATH = vim.env.HOME .. "/.local/share/nvim/"
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.completion.completionItem.resolveSupport =
    {properties = {'documentation', 'detail', 'additionalTextEdits'}}

require("lspconfig").sumneko_lua.setup {
    capabilities = capabilities,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = require("config-lsp/common").common_on_attach,
    settings = {
        Lua = {
            diagnostics = {enable = true, globals = {'vim'}},
            filetypes = {'lua'},
            runtime = {path = vim.split(package.path, ';'), version = 'LuaJIT'}
        }
    }
}
