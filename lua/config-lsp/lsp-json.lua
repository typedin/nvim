-- npm install -g vscode-json-languageserver
require("lspconfig").jsonls.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
        "--stdio"
    }
    -- commands = {
    --     Format = {
    --         function()
    --             vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line "$", 0})
    --         end
    --     }
    -- }
}
