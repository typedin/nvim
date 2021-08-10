require('lualine').setup {
    options = {icons_enabled = true, theme = 'nord'},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {"filetype", 'encoding'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    extensions = {'fugitive', 'quickfix'}
}
