source ~/.config/nvim/vim-plug/plugins.vim

syntax enable
filetype plugin indent on
set number relativenumber
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set wrap

set nobackup
set noswapfile
set noundofile

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🟡'
let g:ale_linters = {
\    'javascript': ['flow-language-server' ]
\}
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let g:rainbow_active = 1

let g:ctrlp_show_hidden = 1
