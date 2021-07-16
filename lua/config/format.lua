local c_lang = function()
    return {
        exe = "clang-format",
        args = {},
        stdin = true,
        cwd = vim.fn.expand('%:p:h') -- Run clang-format in cwd of the file.
    }
end
local tsscript = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end
require('formatter').setup({
    logging = true,
    filetype = {
        c = {c_lang},
        cpp = {c_lang},
        typescript = {tsscript},
        javascript = {tsscript},
        python = {
            function()
                return {exe = "black", args = {"-"}, stdin = true}
            end
        },
        lua = {
            -- luafmt
            function()
                return {exe = "lua-format", args = {"-i"}, stdin = true}
            end
        },
        php = {
            function()
                return {exe = "php-cs-fixer", args = {"fix"}, stdin = false}
            end
        }
    }
})

--[[
  autocmd BufWritePost *.lua FormatWrite
  autocmd BufWritePost *.c FormatWrite
  autocmd BufWritePost *.cpp FormatWrite
  autocmd BufWritePost *.php FormatWrite
  autocmd BufWritePost *.python FormatWrite 
]]

vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]], true)
