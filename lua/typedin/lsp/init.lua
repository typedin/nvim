require "typedin.config.null-ls"

local capabilities = require("typedin.config.nvim-cmp").capabilities

local on_attach = function(client)
    client.server_capabilities.document_formatting = false
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>ca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>R", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<LocalLeader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 }) -- diagnostic list
end

require("lspconfig").antlersls.setup{}

require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").marksman.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").html.setup {
    filetypes = { "html" },
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").emmet_ls.setup {
    filetypes = { "html", "vue", "blade", "css", "antlers" },
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").phpactor.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").tailwindcss.setup {}

require("lspconfig").tsserver.setup {
    debug = true,
    capabilities = capabilities,
    on_attach = on_attach,
    initializationOptions = {
        plugins = {
            {
                name = 'tsconfig-paths',
                location = '~/node_modules/tsconfig-paths',
            }
        }
    }
}

require("lspconfig").volar.setup {
    -- volar by default supports Vue 3 projects. Vue 2 projects need additional configuration.
    -- https://github.com/johnsoncodehk/volar/blob/master/extensions/vscode-vue-language-features/README.md?plain=1#L28-L63
    filetypes = { "vue" },
    capabilities = capabilities,
    on_attach = on_attach,
}

-- require("lsp_lines").setup()
