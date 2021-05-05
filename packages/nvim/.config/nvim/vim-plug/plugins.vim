call plug#begin('~/.local/share/nvim/autoload/plugged')

    Plug 'dense-analysis/ale'
    Plug 'frazrepo/vim-rainbow'
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-commentary'
    Plug 'voldikss/vim-floaterm'

    " LF
    Plug 'ptzz/lf.vim'
    Plug 'voldikss/vim-floaterm'

    " FZF
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    " Language Specific
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'HerringtonDarkholme/yats.vim'

    Plug 'rust-lang/rust.vim'
    Plug 'cespare/vim-toml'

    " Color Scheme
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'haishanh/night-owl.vim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

