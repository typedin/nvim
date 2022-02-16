return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use "tami5/lspsaga.nvim"
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    -- rust
    use "rust-lang/rust.vim"

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
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use 'mhartington/formatter.nvim'
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use('sbdchd/neoformat')

    -- editorconfig
    use 'editorconfig/editorconfig-vim'

    -- fuzzy
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'}
    }

    -- Navigation
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }
    use "tpope/vim-projectionist"
    use "andymass/vim-matchup"
    use "christoomey/vim-tmux-navigator"
    use "tpope/vim-surround"
    use "wincent/scalpel"

    -- GIT
    use "f-person/git-blame.nvim"
    use "tpope/vim-fugitive"
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- autopair
    use "cohama/lexima.vim"

    -- color theme
    use 'EdenEast/nightfox.nvim'

    -- eye candy
    use "lukas-reineke/indent-blankline.nvim"
    use "machakann/vim-highlightedyank"
    use "norcalli/nvim-colorizer.lua"
    use 'pierreglaser/folding-nvim'
    -- syntax highlighting
    use "jwalton512/vim-blade"

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- tdd
    use "neomake/neomake"
    use "kana/vim-vspec"
    use {
        "rcarriga/vim-ultest",
        run = ":UpdateRemotePlugins",
        requires = {"vim-test/vim-test", "preservim/vimux"}
    }

    -- php
    --[[
        must run this command
    --]]
    use {
        "phpactor/phpactor",
        run = '(cd /home/antoine/.local/share/nvim/site/pack/packer/start/phpactor && composer install --no-dev -o )'
    }

    -- completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'
        }
    }
end)
