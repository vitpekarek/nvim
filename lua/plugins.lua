-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use { 'hrsh7th/nvim-compe' }
  -- use { 'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}
  use { 'tzachar/compe-tabnine', requires = 'hrsh7th/nvim-compe'}
  use { 'neovim/nvim-lspconfig' }
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'kosayoda/nvim-lightbulb'
  -- use 'neoclide/coc.nvim'

  -- Lua development
  -- use { 'tjdevries/nlua.nvim' }

  -- Vim dispatch
  -- use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Status Line and Bufferline
  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- general
  use { 'airblade/vim-rooter' }
  use { 'terrortylor/nvim-comment' }
  use { 'andymass/vim-matchup' }
  use { 'phaazon/hop.nvim' }
  use { 'glepnir/dashboard-nvim' }

end)
