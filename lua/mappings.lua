-- /!\ mappings for compe are set in config/nvim-compe /!\
-- Mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- the primeagen
vim.cmd([[
  nnoremap Y y$ 
  nnoremap n nzzzv
  nnoremap N Nzzzv
  nnoremap J mzJ`z
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
  vnoremap J :m '>+1<CR>gv=gv 
  vnoremap K :m '<-2<CR>gv=gv 
  nnoremap <leader>j :m .+1<CR>== 
  nnoremap <leader>k :m .-2<CR>== 
]])
-- scalpel
vim.cmd([[
  nmap <LocalLeader>e <Plug>(Scalpel)

  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
]])

local mode_mappings = {
    -- x mode
    -- Move selected line / block of text in visual mode
    ["J"] = {mode = "x", cmd = ":move '>+1<CR>gv-gv"},
    ["K"] = {mode = "x", cmd = ":move '<-2<CR>gv-gv"},
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
    ["<C-b>"] = {mode = "n", cmd = ":Telescope buffers<cr>"},
    -- show hide white spaces and indent blanklines
    ["<LocalLeader>l"] = {
        mode = "n",
        cmd = ":set list! | :IndentBlanklineToggle<CR>"
    }
}

require("helpers.mappers").mode_mapper(mode_mappings)
