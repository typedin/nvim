require("lspconfig").tailwindcss.setup {
    cmd = {
        DATA_PATH ..
            "/lspinstall/tailwindcss/node_modules/.bin/tailwindcss-language-server",
        "--stdio"
    },
    filetypes = {
        "blade", "vue", "html", "javascriptreact", "javascript.jsx",
        "typescriptreact"
    },
    -- LuaFormatter off
    root_dir = require("lspconfig/util").root_pattern("package.json",
                                                      "tsconfig.json",
                                                      "jsconfig.json", ".git")
}
