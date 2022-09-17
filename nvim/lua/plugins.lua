-- https://github.com/wbthomason/packer.nvim#quickstart

-- local function packer_setup()
--     local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
--     if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--         print('downloading packer.nvim')
--         vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     end
-- end
-- packer_setup()

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'joshdick/onedark.vim'
    use 'itchyny/lightline.vim'
    use {
        'akinsho/bufferline.nvim',
        tags = { 'v2.*' },
        -- requires = 'kyazdani42/nvim-web-devicons',
    }
    use {
        'kyazdani42/nvim-tree.lua',
        -- requires = 'kyazdani42/nvim-web-devicons',
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        -- run = ':TSUpdate'
    }
    use 'neovim/nvim-lspconfig'
    use  {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        }
    }
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'ahmedkhalf/project.nvim'
    }
end)
