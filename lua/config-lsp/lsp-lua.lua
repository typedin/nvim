-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require("lspconfig").sumneko_lua.setup {
    capabilities = require("config-lsp/capabilities"),
    handlers = require("config-lsp/common").handlers,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            diagnostics = {enable = true, globals = {'vim'}},
            filetypes = {'lua'},
            runtime = {path = vim.split(package.path, ';'), version = 'LuaJIT'}
        }
    }
}
