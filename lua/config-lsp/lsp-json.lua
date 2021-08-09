-- npm install -g vscode-json-languageserver
require("lspconfig").jsonls.setup {
    capabilities = require("config-lsp/capabilities"),
    on_attach = require("config-lsp/common").common_on_attach,
    handlers = require("config-lsp/common").handlers,
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
        "--stdio"
    },
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line "$", 0})
            end
        }
    }
}
