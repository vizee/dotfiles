set smartindent
set cindent
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set nobackup
set noswapfile
set confirm
set backspace=indent,eol,start
set laststatus=2
set mouse=a
set selection=exclusive
set encoding=utf-8
set completeopt=menu,menuone
set pumheight=16
set wildmenu
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,utf-16,big5,ucs-bom,shift-jis,euc-jp,latin1
set ruler
set cursorline
"set cursorcolumn
set number
syntax on

call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
call plug#end()

filetype plugin indent on

" config

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/local/rust-analyzer/rust-analyzer-linux'],
    \ 'go': ['gopls'],
    \ }
let g:LanguageClient_diagnosticsEnable = 0

let g:deoplete#enable_at_startup = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

autocmd FileType go,rust autocmd BufWritePre * :call LanguageClient#textDocument_formatting_sync()

set background=dark
set termguicolors
let g:quantum_black = 1
let g:quantum_italics = 0
colorscheme quantum
let g:airline_theme='quantum'

" map keys
map <C-K><C-N> :NERDTreeToggle<CR>
map <C-B><C-N> <Esc>:bn<CR>
map <C-B><C-A> <Esc>:bad
map <C-B><C-P> <Esc>:bp<CR>
map <C-B><C-D> <Esc>:bd<CR>
autocmd FileType rust nnoremap <F7> :Cargo build<CR>
autocmd FileType rust nnoremap <F10> :Cargo run<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
