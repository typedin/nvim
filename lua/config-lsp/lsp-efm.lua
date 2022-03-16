require("lspconfig").efm.setup {
    handlers = require("config-lsp/common").handlers,
    capabilities = require("config-lsp/common").capabilities,
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    -- LuaFormatter off
    filetypes = {
      "javascript",
      "javascript.jsx",
      "javascriptreact",
      "php",
      "python",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
    },
    -- LuaFormatter on
    settings = {}
}
