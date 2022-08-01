local nmap = require("typedin.keymap").nmap

vim.o.updatetime = 50
vim.cmd [[
    autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]]

local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = "",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
    underline = true,
    virtual_text = false,
    -- general purpose
    severity_sort = true,
    update_in_insert = false,
    -- options for floating windows:
    float = {
        show_header = true,
        border = "rounded",
        -- source = "always",
        format = function(d)
            local t = vim.deepcopy(d)
            local code = d.code or d.user_data.lsp.code
            if code then
                t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
            end
            return t.message
        end,
    },
}

local goto_opts = {
    wrap = true,
    float = true,
}

nmap {
    "<space>dn",
    function()
        vim.diagnostic.goto_next(goto_opts)
    end,
}

nmap {
    "<space>dp",
    function()
        vim.diagnostic.goto_prev(goto_opts)
    end,
}

nmap {
    "<space>sl",
    function()
        vim.diagnostic.open_float(0, {
            scope = "line",
        })
    end,
}
