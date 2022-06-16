call plug#begin('~/.local/share/nvim/autoload/plugged')

    Plug 'dense-analysis/ale'
    Plug 'frazrepo/vim-rainbow'
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'nvim-lua/completion-nvim'
    Plug 'ruanyl/vim-gh-line'
    Plug 'taohexxx/lightline-buffer'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-commentary'

    " LSP
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'

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
    Plug 'fatih/vim-go'

    Plug 'rust-lang/rust.vim'
    Plug 'cespare/vim-toml'

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
