return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"

    -- TreeSitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    -- use "folke/trouble.nvim"

    -- formatting
    use 'b3nj5m1n/kommentary'

    -- fuzzy
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Navigation
    use "andymass/vim-matchup"
    use "christoomey/vim-tmux-navigator"
    use "kyazdani42/nvim-tree.lua"
    use "lukas-reineke/indent-blankline.nvim"
    use "tpope/vim-surround"
    use "wincent/scalpel"

    -- GIT
    use "tpope/vim-fugitive"

    -- autopair
    use "cohama/lexima.vim"

    -- eye candy
    use "ap/vim-css-color"
    use "machakann/vim-highlightedyank"
    use "norcalli/nvim-colorizer.lua"

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use 'folke/lsp-colors.nvim'
    use 'pierreglaser/folding-nvim'

    -- completion
    use 'nvim-lua/completion-nvim'

    -- Color
    use "christianchiarulli/nvcode-color-schemes.vim"
    use "rafi/awesome-vim-colorschemes"

    --[[
    -- fuzzy
    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    -- Navigation
    use "andymass/vim-matchup"
    use "christoomey/vim-tmux-navigator"
    use "kyazdani42/nvim-tree.lua"
    use "lukas-reineke/indent-blankline.nvim"
    use "tpope/vim-surround"
    use "wincent/scalpel"

    -- Projects
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "windwp/nvim-spectre"

    -- TreeSitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "folke/trouble.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"

    -- TDD
    use {
        "rcarriga/vim-ultest",
        run = ":UpdateRemotePlugins",
        requires = {"vim-test/vim-test", "preservim/vimux"}
    }

    -- GIT
    use "junegunn/gv.vim"
    use "mhinz/vim-signify"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use "f-person/git-blame.nvim"

    -- Completion
    use "hrsh7th/nvim-compe"
    use "wellle/tmux-complete.vim"

    -- Snippets
    use 'SirVer/ultisnips'
    use {"hrsh7th/vim-vsnip", requires = "kitagry/vs-snippets"}

    -- autopair
    use "windwp/nvim-autopairs"

    -- formatting
    use "sbdchd/neoformat"
    use 'b3nj5m1n/kommentary'
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Color
    use "christianchiarulli/nvcode-color-schemes.vim"
    use "rafi/awesome-vim-colorschemes"

    -- eye candy
    use "ap/vim-css-color"
    use "machakann/vim-highlightedyank"
    use "norcalli/nvim-colorizer.lua"
    use 'kyazdani42/nvim-web-devicons'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'folke/lsp-colors.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'pierreglaser/folding-nvim'

    -- php
    local plugin_prefix = vim.fn.stdpath("data") .. "/site/pack/packer/"
    use {
        "phpactor/phpactor",
        opt = false,
        dir = plugin_prefix,
        run = "composer install --no-dev -o"
    }
  ]]
end)

