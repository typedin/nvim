-- This needs phpactor to be installed globaly
-- https://phpactor.readthedocs.io/en/master/usage/standalone.html#installation-global
---@diagnostic disable: unused-local
local local_buffer_mappings = {
    -- lspsaga
    -- commented by me
    -- must be attached to lsp_config
    ["<LocalLeader>ca"] = "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
    ["<LocalLeader>f"] = "<cmd>Lspsaga lsp_finder<CR>",
    ["<LocalLeader>h"] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
    ["<LocalLeader>ld"] = "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
    ["<LocalLeader>n"] = "<cmd>Lspsaga diagnostic_jump_next<CR>",
    ["<LocalLeader>p"] = "<cmd>Lspsaga diagnostic_jump_prev<CR>",
    ["<LocalLeader>sh"] = "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
    ["<LocalLeader>m"] = "<cmd>PhpactorContextMenu<CR>",
    ["<LocalLeader>r"] = "<cmd>PhpactorTransform<CR>",
    -- lsp
    ["<LocalLeader>gD"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
    ["<LocalLeader>gR"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
    ["<LocalLeader>gd"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
    ["<LocalLeader>gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>",
    ["<LocalLeader>gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
}

local lsp_config = {}
local function common_on_attach(client, bufnr)
    require("helpers.mappers").local_buffer_mapper(local_buffer_mappings)
    client.server_capabilities.document_formatting = false
end

require("lspconfig").phpactor.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    on_attach = common_on_attach,
}
