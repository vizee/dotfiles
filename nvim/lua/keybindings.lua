local opts = { noremap = true, silent = true }

local function noremaps(mode, keyseq, op)
    vim.api.nvim_set_keymap(mode, keyseq, op, opts)
end

local function keymap(mode, keyseq, op)
    vim.api.nvim_set_keymap(mode, keyseq, op, {})
end

-- bufferline

noremaps('n', '<C-b><C-n>', ':BufferLineCycleNext<CR>')
noremaps('n', '<C-b><C-b>', ':BufferLineCyclePrev<CR>')
noremaps('n', '<C-b><C-p>', ':BufferLinePick<CR>')
noremaps('n', '<C-b><C-r>', ':redrawtabline<CR>')

-- nvim-tree

noremaps('n', '<C-k><C-n>', ':NvimTreeToggle<CR>')
noremaps('n', '<C-k><C-f>', ':NvimTreeFindFile<CR>')

-- telescope

noremaps("n", "<C-e>", ":Telescope find_files<CR>")
noremaps("n", "<leader>ld", ":Telescope lsp_document_symbols<CR>")
noremaps("n", "<leader>ll", ":Telescope lsp_dynamic_workspace_symbols<CR>")
noremaps("n", "<C-b><C-f>", ":Telescope buffers<CR>")
noremaps("n", "<C-k><C-r>", ":Telescope projects<CR>")

-- other

noremaps('n', '<C-b><C-d>', ':bdelete<CR>')
keymap('n', '<C-b><C-a>', ':edit<space>')
keymap('n', '<leader>b', ':buffers<CR>:buffer<space>')

noremaps('n', '<C-k><C-t>', ':split | :lcd %:p:h | terminal<CR>')

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"rust"},
    callback = function()
        keymap('n', '<F7>', ':!cargo check<CR>')
        keymap('n', '<F10>', ':!cargo run<CR>')
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"go"},
    callback = function()
        keymap('n', '<F7>', ':!go build<CR>')
        noremaps('n', '<C-k><C-o>', ':lua organize_go_imports()<CR>')
    end
})

