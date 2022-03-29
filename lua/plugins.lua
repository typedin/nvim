-- Have packer use a popup window
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- LSP
    use {
        "neovim/nvim-lspconfig",
        "nvim-lua/lsp-status.nvim",
        "tami5/lspsaga.nvim",
        "williamboman/nvim-lsp-installer",
    }

    -- Javascript / Typescript
    use {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
        },
    }

    -- TreeSitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "p00f/nvim-ts-rainbow"

    -- comment
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- formatting
    use "jose-elias-alvarez/null-ls.nvim"
    use "mhartington/formatter.nvim"
    use "MunifTanjim/prettier.nvim"
    use "sbdchd/neoformat"

    -- editorconfig
    use "editorconfig/editorconfig-vim"

    -- fuzzy
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-fzf-writer.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "nvim-telescope/telescope-github.nvim",
            "nvim-telescope/telescope-hop.nvim",
            "nvim-telescope/telescope-packer.nvim",
            "nvim-telescope/telescope-rs.nvim",
            "nvim-telescope/telescope-smart-history.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
        },
    }

    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Navigation
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    }
    use "tpope/vim-projectionist"
    use "andymass/vim-matchup"
    use "christoomey/vim-tmux-navigator"
    use "tpope/vim-surround"
    use "wincent/scalpel"
    use "chaoren/vim-wordmotion"
    -- Quickfix enhancements. See :help vim-qf
    use "romainl/vim-qf"

    -- GIT
    use "f-person/git-blame.nvim"
    use "tpope/vim-fugitive"
    use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }

    -- autopair
    use "windwp/nvim-autopairs"
    -- Better increment/decrement
    use "monaqa/dial.nvim"

    -- camel case
    use "tpope/vim-abolish"

    -- color theme
    use "EdenEast/nightfox.nvim"

    -- eye candy
    use "lukas-reineke/indent-blankline.nvim"
    use "machakann/vim-highlightedyank"
    use "norcalli/nvim-colorizer.lua"
    use "pierreglaser/folding-nvim"
    use "onsails/lspkind-nvim"
    -- syntax highlighting
    use "jwalton512/vim-blade"
    use "tjdevries/colorbuddy.nvim"
    use {
        "hoob3rt/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }
    --
    -- tdd
    use "neomake/neomake"
    use "kana/vim-vspec"
    use {
        "rcarriga/vim-ultest",
        run = ":UpdateRemotePlugins",
        requires = { "vim-test/vim-test", "preservim/vimux" },
    }

    -- php
    -- must run this command
    use {
        "phpactor/phpactor",
        run = "(cd /home/antoine/.local/share/nvim/site/pack/packer/start/phpactor && composer install --no-dev -o )",
    }

    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
    }

    use {
        "folke/lsp-trouble.nvim",
        cmd = "Trouble",
        config = function()
            -- Can use P to toggle auto movement
            require("trouble").setup {
                auto_preview = false,
                auto_fold = true,
            }
        end,
    }

    -- GIT:
    use "TimUntersberger/neogit"

    -- Github integration
    if vim.fn.executable "gh" == 1 then
        use "pwntester/octo.nvim"
    end
    use "ruifm/gitlinker.nvim"

    -- Sweet message committer
    use "rhysd/committia.vim"
    use "sindrets/diffview.nvim"

    -- Floating windows are awesome :)
    use {
        "rhysd/git-messenger.vim",
        keys = "<Plug>(git-messenger)",
    }

    -- Git worktree utility
    use {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("git-worktree").setup {}
        end,
    }
end)
