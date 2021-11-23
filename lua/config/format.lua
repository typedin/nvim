-- Note: Lachlan Miller:
-- delete the linter(s)
-- https://github.com/mhartington/formatter.nvim/issues/31
-- this is where it is explained how to set many linters/formatters for one
-- filetype
local c_lang = function()
    return {
        args = {},
        cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
        exe = "clang-format",
        stdin = true
    }
end
local prettierConfig = function()
    return {
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        exe = "prettier",
        stdin = true
    }
end
local formatterConfig = {
    c = {c_lang},
    cpp = {c_lang},
    python = {
        -- black
        function() return {exe = "black", args = {"-"}, stdin = true} end
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
    },
    vue = {
        function()
            return {
                exe = "prettier",
                args = {
                    "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                    "--double-quote", "--parser", "vue"
                },
                stdin = true
            }
        end
    }
}
local commonPrettier = {
    "css", "scss", "html", "java", "javascript", "typescript",
    "typescriptreact", "markdown", "markdown.mdx", "json"
}
for _, ft in ipairs(commonPrettier) do formatterConfig[ft] = {prettierConfig} end
require('formatter').setup({logging = false, filetype = formatterConfig})
