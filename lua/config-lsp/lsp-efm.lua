require("lspconfig").efm.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    -- LuaFormatter off
    filetypes = {
      "javascript",
      "javascript.jsx",
      "javascriptreact",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
      "php",
      "python",
    },
    -- LuaFormatter on
    settings = {}
}
