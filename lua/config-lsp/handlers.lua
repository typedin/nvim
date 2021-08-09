local diagnostics = {
    virtual_text = {spacing = 0, prefix = ""},
    signs = true,
    underline = true
}

local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = diagnostics.virtual_text,
            signs = diagnostics.signs,
            underline = diagnostics.underline,
            update_in_insert = true
        })
}

return handlers
