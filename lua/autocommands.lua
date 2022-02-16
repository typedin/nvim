local M = {}
vim.cmd([[
    autocmd BufWritePre * silent! undojoin | silent! Neoformat
    autocmd FileType vue syntax sync fromstart
]])

-- M.autocmd("FileType", "vue", "syntax sync fromstart")
-- M.autocmd("BufWritePre", "*", "%s/\\s\\+$//e")

-- vim.cmd([[
--   autocmd BufWritePre * undojoin | Neoformat
-- ]])

return M
