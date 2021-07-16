--[[
  formatting for those files is handling by the plugin  "nvim-lsp-ts-utils" 
--]]
local typescript = {
      -- @usage can be 'eslint' or 'eslint_d'
      linter = "eslint_d",
      autoformat = true,
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "prettier",
        args = { "--write", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
        stdin = false,
      },
}
local lsp_config = {}
function lsp_config.tsserver_on_attach(client, bufnr)
  -- lsp_config.common_on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false -- setting true here causes a choice between efm or tsserver when formatting

  -- this is a plugin
  local ts_utils = require( "nvim-lsp-ts-utils" )

  -- defaults
  ts_utils.setup {
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,
    import_all_timeout = 5000, -- ms

    -- eslint
    eslint_enable_code_actions = true,
    eslint_enable_disable_comments = true,
    eslint_bin = typescript.linter,
    eslint_config_fallback = nil,
    eslint_enable_diagnostics = true,

    -- formatting
    enable_formatting = typescript.autoformat,
    formatter = typescript.formatter.exe,
    formatter_config_fallback = nil,

    -- parentheses completion
    complete_parens = false,
    signature_help_in_parens = false,

    -- update imports on file move
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = nil,
  }

  -- required to fix code action ranges
  ts_utils.setup_client(client)

end
return lsp_config
