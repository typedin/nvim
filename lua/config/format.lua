-- https://github.com/mhartington/formatter.nvim/issues/31
-- this is where it is exmplained how to set many linters/formatters for one
-- filetype
local c_lang = function()
    return {
        exe = "clang-format",
        args = {},
        stdin = true,
        cwd = vim.fn.expand('%:p:h') -- Run clang-format in cwd of the file.
    }
end
local prettier = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end
local eslint = function()
    return {
        exe = "eslint_d",
        args = {"--stdin-kilename", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end
require('formatter').setup({
    logging = true,
    filetype = {
        c = {c_lang},
        cpp = {c_lang},
        typescript = {prettier, eslint},
        javascript = {prettier, eslint},
        javascriptreact = {prettier, eslint},
        typescriptreact = {prettier, eslint},
        vue = {prettier, eslint},
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

vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]], true)
