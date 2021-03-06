-- use this 'lsp' to format certain types of files
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
---@diagnostic disable-next-line: unused-local
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        formatting.gofmt,
        formatting.stylua,
        formatting.phpcsfixer,
        formatting.black.with { extra_args = { "--fast" } },
        formatting.prettier.with {
            extra_args = {
                "--double-quote",
                "--jsx-double-quote",
                "--tsx-double-quote",
                "--trailing-comma all",
                "--arrow-parens always",
            },
        },
    },
    on_attach = function(client)
        if client.server_capabilities.document_formatting then
            vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]]
        end
    end,
}
