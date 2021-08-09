local local_buffer_mappings = {
    -- lspsaga
    -- must be attached to lsp_config
    -- commented by me
    ["<LocalLeader>f"] = "<cmd>Lspsaga lsp_finder<CR>",
    ["<LocalLeader>n"] = "<cmd>Lspsaga diagnostic_jump_next<CR>",
    ["<LocalLeader>p"] = "<cmd>Lspsaga diagnostic_jump_prev<CR>",
    ["<LocalLeader>h"] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>",
    ["<LocalLeader>ca"] = "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
    ["<LocalLeader>sh"] = "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
    ["<LocalLeader>ld"] = "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<cr>",
    -- lsp
    ["<LocalLeader>gD"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
    ["<LocalLeader>gd"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
    ["<LocalLeader>gR"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
    ["<LocalLeader>gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
    ["<LocalLeader>gf"] = "<cmd>lua vim.lsp.buf.formatting()<CR>",
    ["<LocalLeader>gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>"
}
local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    require("helpers.mappers").local_buffer_mapper(local_buffer_mappings)
end

lsp_config.handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {spacing = 0, prefix = "■"},
            signs = true,
            underline = true,
            update_in_insert = true
        })
}
lsp_config.capabilities = require("config-lsp/capabilities")

return lsp_config
