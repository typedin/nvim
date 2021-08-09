-- /!\ mappings for compe are set in config/nvim-compe /!\
-- Mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- the primeagen
vim.cmd([[
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]])
-- scalpel
vim.cmd([[
  nmap <LocalLeader>e <Plug>(Scalpel)
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
]])

local mappings = {
    ["i"] = {
        [","] = ",<c-g>u",
        ["."] = ".<c-g>u",
        ["?"] = "?<c-g>u",
        ["!"] = "!<c-g>u"
    },
    ["v"] = {
        -- Move selected line / block of text in visual mode
        ["J"] = ":m '>+1<CR>gv=gv",
        ["K"] = ":m '<-2<CR>gv=gv"
    },
    ["x"] = {
        -- Move selected line / block of text in visual mode
        ["J"] = ":move '>+1<CR>gv-gv",
        ["K"] = ":move '<-2<CR>gv-gv"
    },
    ["n"] = {
        -- Move selected line / block of text in visual mode
        ["<leader>j"] = ":m .+1<CR>==",
        ["<leader>k"] = ":m .-2<CR>==",
        -- no hl
        ["<Leader>h"] = ":set hlsearch!<CR>",
        -- Open last buffer
        ["<LocalLeader><LocalLeader>"] = "<C-^>",
        -- NvimTreeToggle
        -- ["<Leader>e"] = ":NvimTreeToggle<cr>",
        -- LuaFormatter off
        ["<Space>"] = "<NOP>",
        -- resizing
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",
        -- show hide white spaces and indent blanklines
        ["<LocalLeader>l"] = ":set list! | :IndentBlanklineToggle<CR>",
        -- Telescope
        ["<C-p>"] = ":Telescope find_files<cr>",
        ["<C-t>"] = ":Telescope help_tags<cr>",
        ["<C-b>"] = ":Telescope buffers<cr>",
        -- the primeagen
        ["Y"] = "y$",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
        ["J"] = "mzJ`z" -- join lines but leave cursor in place
    }
}
for mode, value in pairs(mappings) do
    require("helpers.mappers").mode_mapper(mode, value)
end
