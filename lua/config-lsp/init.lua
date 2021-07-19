require("config-lsp/lsp-css")
require("config-lsp/lsp-efm")
require("config-lsp/lsp-lua")
require("config-lsp/lsp-vim")
require("config-lsp/lsp-json")
require("config-lsp/lsp-html")
require("config-lsp/lsp-python")
require("config-lsp/lsp-php")
require("config-lsp/lsp-tsserver")

--[[ vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {spacing = 8, prefix = ''},
        signs = false,
        update_in_insert = false
    }) ]]
