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

M.setup = function()
    require("lspconfig").efm.setup {
        -- init_options = {initializationOptions},
        cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
        init_options = {documentFormatting = true, codeAction = false},
        filetypes = {
            "lua", "vue", "javascript", "javascriptreact", "typescript",
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
