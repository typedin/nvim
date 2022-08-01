vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '2'
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

require("ufo").setup()
