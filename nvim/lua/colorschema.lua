vim.o.termguicolors = true
vim.o.background = 'dark'

vim.cmd [[
try
  colorscheme one
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
