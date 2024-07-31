-- lualine

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
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
    git = { enable = false },
    filters = { dotfiles = true },
    renderer = {
        root_folder_label = false,
        icons = {
            show = {
                git = false,
                folder = true,
                file = false,
                folder_arrow = false,
            },
            glyphs = {
                default = '',
                symlink = '->',
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
    },
    -- project.nvim
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
}

-- nvim-treesitter

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'c', 'go', 'rust', 'vimdoc' },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { "lua" },
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

-- project.nvim

require("project_nvim").setup {
    detection_methods = { 'lsp', 'pattern' },
    patterns = { '.git' },
    exclude_dirs = {'~/.cargo/*', '~/src/go/pkg/*'},
}

-- telescope

require('telescope').setup {
    defaults = {
        preview = false,
    }
}

require('telescope').load_extension('projects')

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
