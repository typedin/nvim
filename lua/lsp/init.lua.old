-- vim.lsp.set_log_level("debug")
local nvim_lsp = require('lspconfig')
local protocol = require 'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by < c - x > <c-o >
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See`:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<LocalLeader>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<LocalLeader>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<LocalLeader>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<LocalLeader>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<LocalLeader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
                   opts)
    buf_set_keymap('n', '<LocalLeader>ca',
                   '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<LocalLeader>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '<S-C-j>',
                   '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<LocalLeader>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<LocalLeader>f",
                   "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

    -- formatting
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end

    require'completion'.on_attach(client, bufnr)

    protocol.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '' -- TypeParameter
    }
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = {
        "javascript", "typescript", "typescriptreact", "typescript.tsx"
    }
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = {
        "lua", "php", 'javascript', 'javascriptreact', 'json', 'typescript',
        'typescriptreact', 'css', 'scss', 'markdown'
    },
    init_options = {
        linters = {
            eslint = {
                debounce = 100,
                command = 'eslint_d',
                sourceName = 'eslint_d',
                rootPatterns = {'.git'},
                args = {
                    '--stdin', '--stdin-filename', '%filepath', '--format',
                    'json'
                },
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '[eslint] ${message} [${ruleId}]',
                    security = 'severity'
                },
                securities = {[2] = 'error', [1] = 'warning'}
            }
        },
        filetypes = {
            typescript = 'eslint',
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescriptreact = 'eslint'
        },
        formatters = {
            eslint_d = {
                command = 'eslint_d',
                args = {
                    '--stdin', '--stdin-filename', '%filename',
                    '--fix-to-stdout'
                },
                rootPatterns = {'.git'}
            },
            prettier = {
                command = 'prettier',
                args = {'--stdin-filepath', '%filename'}
            }
        },
        formatFiletypes = {
            css = 'prettier',
            json = 'prettier',
            scss = 'prettier',
            less = 'prettier',
            markdown = 'prettier',
            javascript = 'eslint_d',
            javascriptreact = 'eslint_d',
            typescript = 'eslint_d',
            typescriptreact = 'eslint_d'
        }
    }
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = {spacing = 4, prefix = ''}
    })
--
local function setup_servers()
    function on_attach_callback(client, bufnr)
        require('folding').on_attach()
    end
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        if server == "lua" then
            require'lspconfig'[server].setup {
                on_attach = on_attach,
                settings = {Lua = {diagnostics = {globals = {'vim'}}}}
            }
        elseif server == "tsserver" then -- do nothing
        else
            require'lspconfig'[server].setup {on_attach = on_attach}
        end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
