-- npm install -g vim-language-server
require("lspconfig").vimls.setup {
    capabilities = require("config-lsp/capabilities"),
    handlers = require("config-lsp/common").handlers,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {
        DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server",
        "--stdio"
    }
}
