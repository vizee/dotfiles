-- lightline

vim.g.lightline = {
    enable = {
        statusline = 1,
        tabline = 0
    },
    colorscheme = 'quantum',
    active = {
        left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified' } }
    }
}

-- bufferline

require'bufferline'.setup {
    options = {
        diagnostics = 'nvim_lsp',
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left'
            }
        }
    }
}

-- nvim-tree

vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 0,
    folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '>>',
    folder = {
        default = '▸',
        open = '▾',
        empty = '▸',
        empty_open = '▾',
        symlink = '▸',
        symlink_open = '▾',
    }
}

require'nvim-tree'.setup {
    auto_close = false,
    filters = { dotfiles = true },
    git = { enable = false },
    view = {
        hide_root_folder = true,
     },
}

-- nvim-treesitter

require'nvim-treesitter.configs'.setup {
    ensure_installed = {'c', 'go', 'rust'},
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        }
    }
}

-- auto-command

vim.cmd [[
    au TermOpen * setl nonu | start
]]