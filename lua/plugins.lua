return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use lua in ftplugin
    use "tjdevries/astronauta.nvim"

    -- LSP
    use "glepnir/lspsaga.nvim"
    use "kabouzeid/nvim-lspinstall"
    use "neovim/nvim-lspconfig"

    -- Javascript / Typescript
    use {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
            "javascript", "javascriptreact", "javascript.jsx", "typescript",
            "typescriptreact", "typescript.tsx"
        }
    }

    -- TreeSitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- formatting
    use 'b3nj5m1n/kommentary'
    use 'mhartington/formatter.nvim'

    -- fuzzy
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'}
    }

    -- Navigation
    use "kyazdani42/nvim-tree.lua"
    use "andymass/vim-matchup"
    use "christoomey/vim-tmux-navigator"
    use "tpope/vim-surround"
    use "wincent/scalpel"

    -- GIT
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use "f-person/git-blame.nvim"

    -- autopair
    use "cohama/lexima.vim"

    -- eye candy
    use "lukas-reineke/indent-blankline.nvim"
    use "machakann/vim-highlightedyank"
    use "norcalli/nvim-colorizer.lua"
    use 'pierreglaser/folding-nvim'
    use 'sunjon/shade.nvim'

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- completion
    use 'hrsh7th/nvim-compe'
    use 'L3MON4D3/LuaSnip'
    use {"SirVer/ultisnips", requires = "honza/vim-snippets"}

    -- Color
    -- use 'shaunsingh/nord.nvim'
    use "arcticicestudio/nord-vim"
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
end)
