vim.o.guifont = "CamingoCode:h15"
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.2
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_remember_window_size = true

vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.keymap.set({'n', 'v'}, '<C-S-v>', '"*p', {})
vim.keymap.set({'i'}, '<S-Insert>', '<C-r>+', {})
vim.keymap.set({'n', 'v'}, '<C-Insert>', '"+y', {})