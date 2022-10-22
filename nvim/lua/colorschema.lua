vim.cmd [[
try
  colorscheme breezy
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
