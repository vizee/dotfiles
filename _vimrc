set smartindent
set cindent
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
syntax on
set nobackup
set noswapfile
set confirm
set mouse=a
set selection=exclusive
set guifont=Source\ Code\ Pro:h14
set encoding=utf-8
set completeopt=longest,menu
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

" color
let g:molokai_original = 1
let g:rehash256 = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
colorscheme molokai

" vundle plugin
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on
