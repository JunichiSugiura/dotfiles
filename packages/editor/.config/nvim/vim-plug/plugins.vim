call plug#begin('~/.local/share/nvim/autoload/plugged')

    Plug 'frazrepo/vim-rainbow'
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ruanyl/vim-gh-line'
    Plug 'taohexxx/lightline-buffer'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-commentary'

    " LSP
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim' " depends on 'nvim-lua/plenary.nvim'

    " Lua
    Plug 'nvim-lua/plenary.nvim'

    " LF
    Plug 'ptzz/lf.vim'
    Plug 'voldikss/vim-floaterm'

    " FZF
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    " Color Scheme
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'haishanh/night-owl.vim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'wojciechkepka/vim-github-dark'

    " Markdown Preview
    function! BuildComposer(info)
      if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
          !cargo build --release --locked
        else
          !cargo build --release --locked --no-default-features --features json-rpc
        endif
      endif
    endfunction

    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()
