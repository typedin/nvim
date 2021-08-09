local python = {
    -- @usage can be flake8 or yapf
    linter = "",
    isort = false,
    diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
    },
    analysis = {
        type_checking = "basic",
        auto_search_paths = true,
        use_library_code_types = true
    },
    formatter = {exe = "yapf", args = {}}
}

local python_arguments = {}

-- TODO: replace with path argument
local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

if python.linter == "flake8" then table.insert(python_arguments, flake8) end

if python.isort then table.insert(python_arguments, isort) end

-- npm i -g pyright
require("lspconfig").pyright.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    on_attach = require("config-lsp/common").common_on_attach,
    cmd = {
        DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
        "--stdio"
    },
    settings = {
        python = {
            analysis = {
                diagnostics = {enable = true},
                filetypes = {'py'},
                typeCheckingMode = python.analysis.type_checking,
                autoSearchPaths = python.analysis.auto_search_paths,
                useLibraryCodeForTypes = python.analysis.use_library_code_types
            }
        }
    }
}
