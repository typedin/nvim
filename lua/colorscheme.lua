vim.opt.termguicolors = true
local nightfox = require("nightfox")

-- @see here : https://github.com/EdenEast/nightfox.nvim
nightfox.setup({
    fox = "nightfox",
    transparent = true,
    terminal_color = true,
    styles = {
        comments = "italic", -- change style of comments to be italic
        keywords = "bold", -- change style of keywords to be bold
        functions = "italic,bold" -- styles can be a comma separated list
    }
})
nightfox.load()

vim.cmd([[
  augroup BgHighlight
  autocmd!
      autocmd WinEnter * set cul
      autocmd WinLeave * set nocul
  augroup END
]])

-- don't show lualine in NvimTree
vim.cmd([[
  au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]])
