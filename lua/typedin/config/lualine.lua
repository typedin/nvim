require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "nord",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
            {
                "filename",
                file_status = true,
                path = 1,
            },
        },
        lualine_x = { "filetype" },
        lualine_y = { "diagnostics" },
        lualine_z = { "location" },
    },
    extensions = { "fugitive", "quickfix" },
}
