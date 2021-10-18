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
    -- lsp
    ["<LocalLeader>gD"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
    ["<LocalLeader>gR"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
    ["<LocalLeader>gd"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
    ["<LocalLeader>gf"] = "<cmd>lua vim.lsp.buf.formatting()<CR>",
    ["<LocalLeader>gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>",
    ["<LocalLeader>gr"] = "<cmd>lua vim.lsp.buf.references()<CR>"
}
local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    require("helpers.mappers").local_buffer_mapper(local_buffer_mappings)
    client.resolved_capabilities.document_formatting = false
end

lsp_config.handlers = function(client, bufnr)
    return {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                signs = true,
                underline = true,
                virtual_text = false, -- turn off inlined messages
                update_in_insert = false
            })
    }
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_config.capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true,
                resolveSupport = {
                    properties = {
                        'documentation', 'detail', 'additionalTextEdits'
                    }
                }
            }
        }
    }
}

return lsp_config
