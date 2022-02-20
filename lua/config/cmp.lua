-- Setup nvim-cmp.
local cmp = require 'cmp'

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),
                          mode, true)
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end
    },
    mapping = {
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),

        ['<CR>'] = cmp.mapping.confirm({select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, {"i", "s"})
    },
    documentation = {maxwidth = 120, maxheight = 180},
    min_length = 1,
    preselect = true,
    sources = {
        {name = "nvim_lsp", priority = 3000}, {name = "vsnip", priority = 2000},
        {name = "path", priority = 1000}, {name = "buffer", priority = 900}
    }
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{name = 'cmp_git'}}, {{name = 'buffer'}})
})

cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
                         vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['cssls'].setup {capabilities = capabilities}
require('lspconfig')['efm'].setup {capabilities = capabilities}
require('lspconfig')['html'].setup {capabilities = capabilities}
require('lspconfig')['jsonls'].setup {capabilities = capabilities}
require('lspconfig')['phpactor'].setup {capabilities = capabilities}
require('lspconfig')['pyright'].setup {capabilities = capabilities}
require('lspconfig')['sumneko_lua'].setup {capabilities = capabilities}
require('lspconfig')['tailwindcss'].setup {capabilities = capabilities}
require('lspconfig')['tsserver'].setup {capabilities = capabilities}
require('lspconfig')['vimls'].setup {capabilities = capabilities}
require('lspconfig')['vuels'].setup {capabilities = capabilities}
