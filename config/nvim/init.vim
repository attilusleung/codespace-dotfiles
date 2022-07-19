" mouse mode
set mouse=a

" relative line numbers
set number relativenumber

" Allows more vim features
set nocompatible

let g:vimtex_view_general_viewer = 'chromium'

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" enable control-backspace for deleting words in insert mode
noremap! <C-BS> <C-W>
set backspace=indent,eol,start

" minimum lines before screen scrolls
set scrolloff=10

if has("autocmd")
    " Use filetype detection and file-based automatic indenting
    filetype plugin indent on
    syntax on
    " TODO: Should these be in their own filetype plugin?
    autocmd FileType text set textwidth=80
    autocmd Filetype markdown set textwidth=80
    autocmd FileType tex set textwidth=80
    autocmd FileType javascript set ts=2 sts=2 sw=2 tw=80
endif

" Use 4 spaces for tabs for everything else
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=80

" VimPlug autoinstall
if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif
    call plug#begin('~/.config/nvim/plugged')
else
    if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
    call plug#begin()
endif

Plug 'qnighy/lalrpop.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/suda.vim'
Plug 'attilusleung/harmony.vim'
Plug 'ackyshake/Spacegray.vim'

call plug#end()

set termguicolors
color spacegray

lua require('config')
