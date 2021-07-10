require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --break-after-table-lb",
                    formatStdin = true
                }
            },
            php = {
                {
                    formatCommand = "/home/antoine/.local/share/nvim/lspinstall/php/node_modules/.bin/intelephense",
                    formatStdin = true
                }
            }
        }
    }
}
