CACHE_PATH = vim.fn.stdpath "cache"
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"
O = {
    snippets = {dir = CONFIG_PATH .. "/snippets"},
    settings = {
        symbols = {
            error = '⭙',
            hint = '➲',
            info = '🛈',
            warn = '⚠',
            bug = ' '
        }
    }
}
local saga = require 'lspsaga'

-- custom colors: https://github.com/glepnir/lspsaga.nvim#colors
vim.cmd([[
  highlight link LspSagaFinderSelection Search
]])

saga.init_lsp_saga {
    code_action_icon = '', -- this won't show the bulb icon
    use_saga_diagnostic_sign = true, -- this will show the icon in the number column
    diagnostic_header_icon = O.settings.symbols.bug,
    error_sign = O.settings.symbols.error,
    hint_sign = O.settings.symbols.hint,
    infor_sign = O.settings.symbols.info,
    warn_sign = O.settings.symbols.warn,
    border_style = "single"
}
