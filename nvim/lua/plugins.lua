local function lazy_setup()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)
end

lazy_setup()

require("lazy").setup({
    spec = {
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter',
        'numToStr/FTerm.nvim',
        'nvim-lualine/lualine.nvim',
        'rakr/vim-one',
        { 'akinsho/bufferline.nvim', version = "*" },
        'kyazdani42/nvim-tree.lua',
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
            }
        },
        'L3MON4D3/LuaSnip',
        { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
        'ahmedkhalf/project.nvim',
        -- { 'nvimdev/indentmini.nvim', opts = { char = '|' } },
    }
})
