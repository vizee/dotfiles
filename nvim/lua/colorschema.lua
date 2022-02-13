vim.g.quantum_black = 1
vim.g.quantum_italics = 0

vim.cmd [[
try
  colorscheme quantum
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme desert
endtry
]]
