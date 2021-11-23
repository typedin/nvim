local M = {}

function M.autocmd(event, triggers, operations)
    local cmd = string.format("autocmd %s %s %s", event, triggers, operations)
    vim.cmd(cmd)
end

M.autocmd("FileType", "vue", "syntax sync fromstart")
M.autocmd("BufWritePost", "*", "FormatWrite")
M.autocmd("BufWritePre", "*", "%s/\\s\\+$//e")

return M
