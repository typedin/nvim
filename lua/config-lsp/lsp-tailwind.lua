require("lspconfig").tailwindcss.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {
        DATA_PATH ..
            "/lspinstall/tailwindcss/node_modules/.bin/tailwindcss-language-server",
        "--stdio"
    },
    filetypes = {
        "vue", "html", "javascriptreact", "javascript.jsx", "typescriptreact"
    },
    root_dir = require("lspconfig/util").root_pattern("package.json",
                                                      "tsconfig.json",
                                                      "jsconfig.json", ".git")
}
