local nnoremap = function(lhs, rhs)
    vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs,
                                {noremap = true, silent = true})
end

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    local mappings = {
        ["<LocalLeader>gD"] = "<cmd>lua vim.lsp.buf.definition()<cr>",
        ["<LocalLeader>gd"] = "<cmd>lua vim.lsp.buf.declaration()<cr>",
        ["<LocalLeader>h"] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>",
        ["<LocalLeader>ca"] = "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
        ["<LocalLeader>sh"] = "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
        ["<LocalLeader>ld"] = "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<cr>"
    }
    for lhs, rhs in pairs(mappings) do nnoremap(lhs, rhs) end
end
return lsp_config
