local M = {}
vim.cmd([[
    autocmd BufNewFile,BufRead *.blade.php set filetype=blade
]])

function M.autocmd(event, triggers, operations)
    local cmd = string.format("autocmd %s %s %s", event, triggers, operations)
    vim.cmd(cmd)
end

M.autocmd("FileType", "vue", "syntax sync fromstart")
M.autocmd("BufWritePre", "*", "%s/\\s\\+$//e")

local filetypes = {
    "blade.php", "css", "html", "js", "javascript", "javascript.jsx",
    "javascriptreact", "json", "lua", "php", "python", "react", "ts", "tsx",
    "typescript", "typescript.tsx", "typescriptreact", "vue", "scss", "java",
    "typescriptreact", "markdown", "markdown.mdx"
}

---@diagnostic disable-next-line: unused-local
for _, value in pairs(filetypes) do
    local extension = "*." .. value
    M.autocmd("BufWritePost", extension, "FormatWrite")
end

-- autocmd BufWritePost blade :silent execute "!blade-formatter --write %"

return M
