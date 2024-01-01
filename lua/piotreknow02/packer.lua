-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Theme
    use {
        'bluz71/vim-moonfly-colors',
        as = 'moonfly',
        config = function()
            vim.cmd('colorscheme moonfly')
        end
    }

    use 'j-hui/fidget.nvim'

    use {
        'linrongbin16/lsp-progress.nvim',
        config = function()
            require('lsp-progress').setup()
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' },
        requires = {
            { "HiPhish/nvim-ts-rainbow2" },
            { "windwp/nvim-ts-autotag" }
        }
    }

    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'}
        }
    }

    use 'ThePrimeagen/Harpoon'

    use 'mbbill/undotree'

    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    }

    use {
        'folke/trouble.nvim',
        requires = {
            { 'nvim-tree/nvim-web-devicons' }
        }
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        scope = { enabled = false },
        config = function()
            require("ibl").setup { scope = { enabled = false } }
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},

            -- Rust analyzer
            {'simrat39/rust-tools.nvim'}
        }
    }

    use 'eandrju/cellular-automaton.nvim'

    use 'windwp/nvim-autopairs'

    use 'lewis6991/gitsigns.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'norcalli/nvim-colorizer.lua'

end)

