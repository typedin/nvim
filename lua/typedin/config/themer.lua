require("themer").setup({ enable_installer = true })

local config = require("themer").setup {
    colorscheme = "nord",
    transparent = true,
    term_color = true,
    dim_inactive = false,
    styles = {
        ["function"] = { style = "italic,bold" },
        comments = "italic", -- change style of comments to be italic
        functionbuiltin = { style = "bold" },
        functions = "italic,bold", -- styles can be a comma separated list
        keywords = "bold", -- change style of keywords to be bold
        parameter = { style = "italic" },
        variable = { style = "italic" },
        variableBuiltIn = { style = "italic" },
    },
}

return config
