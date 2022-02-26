-- /!\ mappings for compe are set in config/nvim-compe /!\
-- Mappings.
vim.g.mapleader = " " -- leader should act for anything that interacts with outside
vim.g.maplocalleader = "," -- LocalLeader should act for anything buffer related

-- quickly open config files
vim.cmd([[
    nmap <leader>ve :edit ~/.config/nvim/init.lua<cr>
    nmap <leader>vm :edit ~/.config/nvim/lua/mappings.lua<cr>
]])

-- the primeagen
vim.cmd([[
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]])

-- scalpel
vim.cmd([[
  nmap <LocalLeader>e <Plug>(Scalpel)
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
        ["K"] = ":m '<-2<CR>gv=gv",
        -- Reselect visual selection after indenting
        ["<"] = "<gv",
        [">"] = ">gv"
    },
    ["x"] = {
        -- Move selected line / block of text in visual mode
        ["J"] = ":move '>+1<CR>gv-gv",
        ["K"] = ":move '<-2<CR>gv-gv"
    },
    ["n"] = {
        -- Move selected line / block of text in visual mode
        ["<LocalLeader>j"] = ":m .+1<CR>==",
        ["<LocalLeader>k"] = ":m .-2<CR>==",
        -- no hl
        ["<LocalLeader>th"] = ":set hlsearch!<CR>",
        -- Open last buffer
        ["<LocalLeader><LocalLeader>"] = "<C-^>",
        -- Go to alternate file 
        ["<Leader>a"] = ":A<cr>",
        -- NvimTreeToggle
        ["<Leader>e"] = ":NvimTreeToggle<cr>",
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
        -- Harpoon
        ["<C-e>"] = ":lua require('harpoon.ui').toggle_quick_menu()<cr>",
        ["<Leader>af"] = ":lua require('harpoon.mark').add_file()<cr>",
        -- ["<C-i>"] = ":lua require('harpoon.ui').toggle_quick_menu()<cr>",
        -- the primeagen
        ["Y"] = "y$",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
        ["J"] = "mzJ`z", -- join lines but leave cursor in place
        -- testing
        ["tcr"] = ":call ToggleStrategy()<CR>"
    }
}
for mode, value in pairs(mappings) do
    require("helpers.mappers").mode_mapper(mode, value)
end
