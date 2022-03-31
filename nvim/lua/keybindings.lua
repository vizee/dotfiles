local opts = { noremap = true, silent = true }
local function noremap(mode, keyseq, op)
    vim.api.nvim_set_keymap(mode, keyseq, op, opts)
end

-- bufferline

noremap('n', '<C-b><C-n>', ':BufferLineCycleNext<CR>')
noremap('n', '<C-b><C-b>', ':BufferLineCyclePrev<CR>')
noremap('n', '<C-b><C-p>', ':BufferLineCyclePick<CR>')
noremap('n', '<C-b><C-r>', ':redrawtabline<CR>')

-- nvim-tree

noremap('n', '<C-k><C-n>', ':NvimTreeToggle<CR>')
noremap('n', '<C-k><C-f>', ':NvimTreeFindFile<CR>')

-- telescope

noremap("n", "<C-e>", ":Telescope find_files<CR>", opts)

-- oher

noremap('n', '<C-b><C-d>', ':bdelete<CR>')
vim.api.nvim_set_keymap('n', '<C-b><C-a>', ':edit<space>', {})
vim.api.nvim_set_keymap('n', '<leader>b', ':buffers<CR>:buffer<space>', {})


noremap('n', '<C-k><C-t>', ':split | :lcd %:p:h | terminal<CR>')

vim.cmd [[
    autocmd FileType rust nnoremap <F7> :!cargo check<CR>
    autocmd FileType rust nnoremap <F10> :!cargo run<CR>
    autocmd FileType go nnoremap <silent> <C-k><C-o> :lua organize_go_imports()<CR>
]]
