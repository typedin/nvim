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
local formatterConfig = {
    c = {c_lang},
    cpp = {c_lang},
    python = {
        -- black
        function() return {exe = "black", args = {"-"}, stdin = true} end
    },
    -- blade = {
    --     -- blade-formatter
    --     function()
    --         return {
    --             exe = "blade-formatter",
    --             args = {"--write", "--stdin", vim.api.nvim_buf_get_name(0)},
    --             stdin = true
    --         }
    --     end
    -- },
    lua = {
        -- luafmt
        function()
            return {exe = "lua-format", args = {"-i"}, stdin = true}
        end
    },
    -- php = {
    --     function()
    --         return {exe = "php-cs-fixer", args = {"fix"}, stdin = false}
    --     end
    -- },
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

local null_ls = require("null-ls")
local prettier = require("prettier")

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.resolved_capabilities.document_formatting then
            vim.cmd(
                "nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
        end

        if client.resolved_capabilities.document_range_formatting then
            vim.cmd(
                "xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end
})

prettier.setup({
    bin = 'prettier', -- or `prettierd`
    filetypes = {
        "blade", "css", "graphql", "html", "javascript", "javascriptreact",
        "json", "less", "markdown", "scss", "typescript", "typescriptreact",
        "yaml", "js", "ts"
    },

    -- prettier format options (you can use config files too. ex: `.prettierrc`)
    arrow_parens = "always",
    bracket_spacing = true,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_quote = false,
    tab_width = 4,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false
})

require('formatter').setup({logging = false, filetype = formatterConfig})
