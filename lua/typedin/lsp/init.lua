local capabilities = require("typedin.config.nvim-cmp").capabilities

local on_attach = function ()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>ca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>R", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 }) -- diagnostic list
end

require('lspconfig').gopls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig').sumneko_lua.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

