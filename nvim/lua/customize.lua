-- lightline

vim.g.lightline = {
    enable = {
        statusline = 1,
        tabline = 0
    },
    colorscheme = 'onedark',
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
    },
    highlights = {
        buffer_selected = {
            bold = true,
            italic = false,
        },
    },
}

-- nvim-tree

require'nvim-tree'.setup {
    filters = { dotfiles = true },
    git = { enable = false },
    view = {
        hide_root_folder = true,
    },
    renderer = {
        icons = {
            show = {
                git = false,
                folder = true,
                file = false,
                folder_arrow = false,
            },
            glyphs = {
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
            },
        },
    }
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
            node_incremental = '<CR>',
            scope_incremental = '<TAB>',
            node_decremental = '<BS>',
        }
    }
}

-- telescope

require('telescope').setup {
    defaults = {
        preview = false,
    }
}

-- luasnip

require'luasnip.config'.set_config {
    history = false,
}

-- auto-command

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown"},
    callback = function()
        vim.wo.wrap = true
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = {"*"},
    command = "setl nonu | start"
})
