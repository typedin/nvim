-- This needs phpactor to be installed globaly
-- https://phpactor.readthedocs.io/en/master/usage/standalone.html#installation-global
require'lspconfig'.phpactor.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    on_attach = require("config-lsp/common").common_on_attach
}
