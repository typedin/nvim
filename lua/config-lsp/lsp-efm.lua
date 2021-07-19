local tsserver_args = {}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename {INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin  --stdin-filename=${INPUT}",
    formatStdin = true
}
table.insert(tsserver_args, eslint)

require("lspconfig").efm.setup {
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = false, codeAction = true},
    filetypes = {
        "lua", "php", "vue", "javascript", "javascriptreact", "typescript",
        "typescriptreact", "javascript.jsx", "typescript.tsx"
    },
    settings = {
        rootMarkers = {".git/", "package.json"},
        languages = {
            vue = tsserver_args,
            javascript = tsserver_args,
            javascriptreact = tsserver_args,
            ["javascript.jsx"] = tsserver_args,
            typescript = tsserver_args,
            ["typescript.tsx"] = tsserver_args,
            typescriptreact = tsserver_args
        }
    }
}
