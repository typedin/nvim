local config = require("themer").setup {
    enable_installer = true,
    colorscheme = "monokai_pro",
    transparent = true,
    term_color = true,
    dim_inactive = true,
    styles = {
        ["function"] = "bold",
        comment = { style = "italic,bold" }, -- change style of comments to be italic
        functionbuiltin = { style = "bold" },
        functions = "bold", -- styles can be a comma separated list
        keywords = "bold", -- change style of keywords to be bold
        parameter = { style = "italic" },
        variable = { style = "italic" },
        variableBuiltIn = { style = "italic" },
    },
    plugins = {
        bufferline = true,
        cmp = true,
        gitsigns = true,
        indentline = true,
        lsp = true,
        lualine = true,
        telescope = true,
        treesitter = true,
    },
    remaps = {
        [ "LineNr" ] = "#606060",
    }
}

return config
