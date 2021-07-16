local M = {}
local lua_args = {}
local tsserver_args = {}

local luaformat = {formatCommand = "lua-format -i", formatStdin = true}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename {INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin  --stdin-filename=${INPUT}",
    formatStdin = true
}
table.insert(lua_args, luaformat)
table.insert(tsserver_args, eslint)

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- Mappings.
    local opts = {noremap = true, silent = true}
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<LocalLeader>=",
                       "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<LocalLeader>=",
                       "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
end
M.setup = function()
    require("lspconfig").efm.setup {
        -- init_options = {initializationOptions},
        cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
        on_attach = on_attach,
        init_options = {documentFormatting = true, codeAction = true},
        filetypes = {
            "php", "lua", "vue", "javascript", "javascriptreact", "typescript",
            "typescriptreact", "javascript.jsx", "typescript.tsx"
        },
        settings = {
            rootMarkers = {".git/", "package.json"},
            languages = {
                lua = lua_args,
                vue = tsserver_args,
                javascript = tsserver_args,
                javascriptreact = tsserver_args,
                ["javascript.jsx"] = tsserver_args,
                typescript = tsserver_args,
                ["typescript.tsx"] = tsserver_args,
                typescriptreact = tsserver_args
            }
        }
    }
end

return M
