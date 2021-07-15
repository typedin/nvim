local lspconfig = require 'lspconfig'

-- important
require'lspinstall'.setup()

-- Setup everything on lsp attach
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>rm',
                   '<cmd>lua require\'lsp-ui.rename\'.rename()<CR>', opts)
    buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.references()<CR>',
                   opts)
    buf_set_keymap('n', '<space>d',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                   opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                       opts)
        vim.api.nvim_exec([[
            augroup formatting
                autocmd!
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)
            augroup END
        ]], true)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                       opts)
    end
end

-- Formatting via efm
local luafmt = require "config/efm-formatting/luafmt"
local languages = {lua = {luafmt}}

lspconfig.efm.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(languages),
    init_options = {documentFormatting = true, codeAction = true},
    root_dir = lspconfig.util.root_pattern("package.json", "composer.json",
                                           ".git/"),
    settings = {
        log_level = 1,
        languages = languages,
        log_file = '/home/antoine/.config/efm-langserver/efm.log'
    }
}

local function setup_servers()
    -- require'lspinstall'.setup()
    local required_servers = {"lua"}
    local installed_servers = require'lspinstall'.installed_servers()
    for _, server in pairs(required_servers) do
        if not vim.tbl_contains(installed_servers, server) then
            require'lspinstall'.install_server(server)
        end
        require'lspconfig'[server].setup {on_attach = on_attach}
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
