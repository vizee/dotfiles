require 'options'

if not vim.g.vscode then
require 'plugins'
require 'keybindings'
require 'colorschema'
require 'customize'
require 'lsp'
require 'snippets'
end

if vim.g.neovide then
    require 'neovide'
end
