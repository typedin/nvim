-- make sure tsserver is not used for formatting
require("lspconfig").vuels.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {DATA_PATH .. "/lspinstall/vue/node_modules/.bin/vls", "--stdio"},
    filetypes = {"vue"},
    root_dir = require("lspconfig/util").root_pattern("package.json",
                                                      "tsconfig.json",
                                                      "jsconfig.json", ".git")
}
