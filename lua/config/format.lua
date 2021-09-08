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
local json = function()
    return {
        exe = "jsonlint",
        args = {"--stdin-kilename", vim.api.nvim_buf_get_name(0)},
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

local markdown = function()
    return {
        exe = "markdownlint",
        args = {"--fix", vim.api.nvim_buf_get_name(0)},
        stdin = false
    }
end

local css = function()
    return {
        exe = "stylelint",
        args = {"--fix", vim.api.nvim_buf_get_name(0)},
        stdin = false
    }
end

require('formatter').setup({
    logging = true,
    filetype = {
        c = {c_lang},
        cpp = {c_lang},
        css = {css},
        typescript = {prettier, eslint},
        javascript = {prettier, eslint},
        javascriptreact = {prettier, eslint},
        json = {json},
        typescriptreact = {prettier, eslint},
        vue = {prettier, eslint},
        markdown = {markdown},
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
  autocmd BufWritePre * %s/\s\+$//e
]], true)
