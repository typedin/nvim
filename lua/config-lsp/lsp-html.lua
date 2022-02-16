-- npm install -g vscode-html-languageserver-bin
require("lspconfig").html.setup {
    -- handlers = require("config-lsp/common").handlers,
    -- capabilities = require("config-lsp/common").capabilities,
    -- on_attach = require("config-lsp/common").common_on_attach,
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
        "--stdio"
    }
}
