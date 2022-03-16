-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Color schemes
    -- use { 'sainnhe/gruvbox-material' }
    -- use 'tiagovla/tokyodark.nvim'
    use 'folke/tokyonight.nvim'
    use 'folke/lsp-colors.nvim'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- LSP and completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-emoji'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/nvim-cmp'
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    -- use 'hrsh7th/vim-vsnip'
    -- use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    use { 'ylcnfrht/vscode-python-snippet-pack' }
    use { 'xabikos/vscode-javascript' }
    -- use { 'golang/vscode-go' }
    use { 'rust-lang/vscode-rust' }

    -- Git
    use { 
        'TimUntersberger/neogit', 
        requires = { 
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim' 
        }
    }
    use 'airblade/vim-gitgutter'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    -- use 'nvim-treesitter/playground'
    -- use 'p00f/nvim-ts-rainbow'
    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Status Line and Bufferline
    use 'hoob3rt/lualine.nvim'
    use 'romgrk/barbar.nvim'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Terminal
    use {"akinsho/toggleterm.nvim"}

    -- general
    use { 'windwp/nvim-autopairs' }
    -- use { 'airblade/vim-rooter' }
    use { 'ahmedkhalf/project.nvim' }
    -- use { 'terrortylor/nvim-comment' }
    use { 'tpope/vim-commentary' }
    use { 'andymass/vim-matchup' }
    use { 'phaazon/hop.nvim' }
    use { 'glepnir/dashboard-nvim' }
    use { 'windwp/nvim-spectre' }
    use { 'AckslD/nvim-neoclip.lua' }

end)
