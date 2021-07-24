-- /!\ mappings for compe are set in config/nvim-compe /!\
-- Mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- scalpel
vim.cmd([[
  nmap <LocalLeader>e <Plug>(Scalpel)
]])

local mode_mappings = {
    -- x mode
    -- Move selected line / block of text in visual mode
    ["K"] = {mode = "x", cmd = ":move '<-2<CR>gv-gv"},
    ["J"] = {mode = "x", cmd = ":move '>+1<CR>gv-gv"},
    -- n mode
    -- LuaFormatter off
    ["<Space>"] = {mode = "n", cmd = "<NOP>"},
    -- resizing
    ["<C-Up>"] = {mode = "n", cmd = ":resize -2<CR>"},
    ["<C-Down>"] = {mode = "n", cmd = ":resize +2<CR>"},
    ["<C-Left>"] = {mode = "n", cmd = ":vertical resize -2<CR>"},
    ["<C-Right>"] = {mode = "n", cmd = ":vertical resize +2<CR>"},
    -- NvimTreeToggle
    ["<Leader>e"] = {mode = "n", cmd = ":NvimTreeToggle<cr>"},
    -- no hl
    ["<Leader>h"] = {mode = "n", cmd = ":set hlsearch!<CR>"},
    -- Open last buffer
    ["<LocalLeader><LocalLeader>"] = {mode = "n", cmd = "<C-^>"},
    -- Telescope
    ["<C-p>"] = {mode = "n", cmd = ":Telescope find_files<cr>"},
    ["<C-t>"] = {mode = "n", cmd = ":Telescope help_tags<cr>"},
    ["<C-b>"] = {mode = "n", cmd = ":Telescope buffers<cr>"}
}

local local_buffer_mappings = {
    -- show hide white spaces and indent blanklines
    ["<Leader>l"] = ":set list! | :IndentBlanklineToggle<CR>",
    -- lsp
    ["<LocalLeader>gD"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
    ["<LocalLeader>gd"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
    ["<LocalLeader>gR"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
    ["<LocalLeader>gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
    ["<LocalLeader>gf"] = "<cmd>lua vim.lsp.buf.formatting()<CR>",
    ["<LocalLeader>gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>"
}

local mode_mapper = function(mappings)
    local nnoremap = function(lhs, rhs)
        local _opts = {noremap = true, silent = true}
        vim.api.nvim_set_keymap(rhs.mode, lhs, rhs.cmd, _opts)
    end

    for lhs, rhs in pairs(mappings) do nnoremap(lhs, rhs) end
end
mode_mapper(mode_mappings)

local local_buffer_mapper = function(mappings)
    local nnoremap = function(lhs, rhs)
        local _opts = {noremap = true, silent = true}
        vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, _opts)
    end

    for lhs, rhs in pairs(mappings) do nnoremap(lhs, rhs) end
end
local_buffer_mapper(local_buffer_mappings)
local fuck
