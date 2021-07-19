require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'nord',
        section_separators = {'', ''},
        component_separators = {'', ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {
            {
                'diagnostics',
                sources = {"nvim_lsp"},
                symbols = {
                    error = O.settings.symbols.error,
                    wran = O.settings.symbols.wran,
                    info = O.settings.symbols.info,
                    hint = O.settings.symbols.hint
                }
            }, 'encoding', 'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive'}
}
