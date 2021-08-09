-- npm install -g vscode-css-languageserver-bin
require("lspconfig").cssls.setup {
    handlers = require("config-lsp/common").handlers,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    }
}
