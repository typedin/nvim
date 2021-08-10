require('gitsigns').setup {
    numhl = false,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true
    },
    watch_index = {interval = 1000},
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
    use_decoration_api = false
}
