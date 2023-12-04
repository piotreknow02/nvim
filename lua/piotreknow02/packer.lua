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

    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }

    use 'theprimeagen/harpoon'

    use 'mbbill/undotree'

    use {
        "folke/trouble.nvim",
        requires = {
            { "nvim-tree/nvim-web-devicons" }
        }
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
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            -- Rust analyzer
            {'simrat39/rust-tools.nvim'}
        }
    }

    use 'lewis6991/gitsigns.nvim'

    use {
        'vim-airline/vim-airline',
        requires = { {'vim-airline/vim-airline-themes'} }
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'norcalli/nvim-colorizer.lua'

end)

