-- Mappings.
vim.g.mapleader = " " -- leader should act for anything that interacts with outside
vim.g.maplocalleader = "," -- LocalLeader should act for anything buffer related

-- scalpel
vim.cmd [[
  nmap <LocalLeader>e <Plug>(Scalpel)
]]

-- the primeagen
vim.cmd [[
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]]

local mappings = {
    ["i"] = {
        [","] = ",<c-g>u",
        ["."] = ".<c-g>u",
        ["?"] = "?<c-g>u",
        ["!"] = "!<c-g>u",
    },
    ["v"] = {
        -- Move selected line / block of text in visual mode
        ["J"] = ":m '>+1<CR>gv=gv",
        ["K"] = ":m '<-2<CR>gv=gv",
        -- Reselect visual selection after indenting
        ["<"] = "<gv",
        [">"] = ">gv",
    },
    ["x"] = {
        -- Move selected line / block of text in visual mode
        ["J"] = ":move '>+1<CR>gv-gv",
        ["K"] = ":move '<-2<CR>gv-gv",
    },
    ["n"] = {
        -- lspsaga
        -- commented by me
        -- must be attached to lsp_config
        ["<LocalLeader>ca"] = "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
        ["<LocalLeader>f"] = "<cmd>Lspsaga lsp_finder<CR>",
        ["<LocalLeader>sh"] = "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
        -- lsp
        ["<LocalLeader>gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
        ["<LocalLeader>gD"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
        ["<LocalLeader>gT"] = "<cmd>lua vim.lsp.buf.type_definition()<CR>",
        ["<LocalLeader>gR"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
        ["<LocalLeader>gf"] = "<cmd>lua vim.lsp.buf.format({async = true })<CR>",
        ["<LocalLeader>gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>",
        ["<LocalLeader>gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
        -- Move selected line / block of text in visual mode
        ["<LocalLeader>j"] = ":m .+1<CR>==",
        ["<LocalLeader>k"] = ":m .-2<CR>==",
        -- no hl
        ["<LocalLeader>th"] = ":set hlsearch!<CR>",
        -- Open last buffer
        ["<LocalLeader><LocalLeader>"] = "<C-^>",
        -- Go to alternate file
        ["<Leader>a"] = ":A<cr>",
        -- LuaFormatter off
        ["<Space>"] = "<NOP>",
        -- resizing
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",
        -- show hide white spaces and indent blanklines
        ["<LocalLeader>l"] = ":set list!<CR>",
        -- the primeagen
        ["Y"] = "y$",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
        ["J"] = "mzJ`z", -- join lines but leave cursor in place
    },
}
for mode, value in pairs(mappings) do
    require("helpers.mappers").mode_mapper(mode, value)
end
