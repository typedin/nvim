local M = {}

function M.local_buffer_mapper(mappings)
    local nnoremap = function(lhs, rhs)
        local _opts = {noremap = true, silent = true}
        vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, _opts)
    end

    for lhs, rhs in pairs(mappings) do nnoremap(lhs, rhs) end
end

function M.mode_mapper(mappings)
    local nnoremap = function(lhs, rhs)
        local _opts = {noremap = true, silent = true}
        vim.api.nvim_set_keymap(rhs.mode, lhs, rhs.cmd, _opts)
    end

    for lhs, rhs in pairs(mappings) do nnoremap(lhs, rhs) end
end

return M
