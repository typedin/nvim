local saga = require 'lspsaga'

-- custom colors: https://github.com/glepnir/lspsaga.nvim#colors
vim.cmd([[
  highlight link LspSagaFinderSelection Search
]])

saga.init_lsp_saga {
    border_style = "single",
    use_saga_diagnostic_sign = true,
    error_sign = O.settings.symbols.error,
    hint_sign = O.settings.symbols.hint,
    infor_sign = O.settings.symbols.info,
    warn_sign = O.settings.symbols.warn,
    dianostic_header_icon = '➤',
    code_action_keys = {quit = 'q', exec = '<CR>'},
    code_action_icon = O.settings.symbols.info .. " ",
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>' -- quit can be a table
    },
    rename_action_keys = {
        quit = '<C-c>',
        exec = '<CR>' -- quit can be a table
    },
    definition_preview_icon = '  ',
    rename_prompt_prefix = '➤'
    -- server_filetype_map = {}
}
