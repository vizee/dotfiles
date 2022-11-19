if vim.fn.has('mac') then
    vim.o.guifont = "MonoLisa:h16"
end
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.3
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_remember_window_size = true

vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.keymap.set({'n', 'v'}, '<C-S-v>', '"*p', {})
vim.keymap.set({'i'}, '<S-Insert>', '<C-r>+', {})
vim.keymap.set({'n', 'v'}, '<C-Insert>', '"+y', {})

if vim.fn.has('unix') then
    vim.fn.setenv('GOPATH', vim.fn.expand('$HOME/src/go'))
    vim.fn.setenv('PATH', vim.fn.expand('$PATH' ..
        ':$HOME/local/bin' .. 
        ':$HOME/local/go/bin' .. 
        ':$HOME/src/go/bin' .. 
        ':$HOME/.cargo/bin'))
    vim.fn.chdir(vim.fn.expand('$HOME'))
end
