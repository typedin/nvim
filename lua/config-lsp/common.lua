local nnoremap = function(lhs, rhs)
    local _opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, _opts)
end
local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    local mappings = {
        -- lsp
        ["<LocalLeader>gD"] = "<cmd>lua vim.lsp.buf.definition()<cr>",
        ["<LocalLeader>gd"] = "<cmd>lua vim.lsp.buf.declaration()<cr>",
        -- lspsaga
        ["<LocalLeader>f"] = "<Cmd>Lspsaga lsp_finder<CR>",
        ["<LocalLeader>n"] = "<Cmd>Lspsaga diagnostic_jump_next<CR>",
        ["<LocalLeader>p"] = "<Cmd>Lspsaga diagnostic_jump_prev<CR>",
        ["<LocalLeader>h"] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>",
        ["<LocalLeader>ca"] = "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
        ["<LocalLeader>sh"] = "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
        ["<LocalLeader>ld"] = "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<cr>"
    }
    for lhs, rhs in pairs(mappings) do nnoremap(lhs, rhs) end
end

return lsp_config
