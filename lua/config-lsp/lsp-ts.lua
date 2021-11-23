-- make sure tsserver is not used for formatting
require("lspconfig").tsserver.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {
        DATA_PATH ..
            "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
        "--stdio"
    },
    -- LuaFormatter off
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    },
    -- LuaFormatter off
    root_dir = require("lspconfig/util").root_pattern("package.json",
                                                      "tsconfig.json",
                                                      "jsconfig.json", ".git")
}
