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
