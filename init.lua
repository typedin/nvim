O = {
    snippets = {dir = "/home/antoine/.config/nvim/snippets"},
    settings = {
        symbols = {error = '✖', warn = '⚠', info = 'ℹ', hint = '➤'}
    }
}
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

require("settings")
require("plugins")
require("colorscheme")
require("config")
require("utils")
require("config-lsp")

require("mappings") -- should be a good idea to move all plugin bindings into this file
