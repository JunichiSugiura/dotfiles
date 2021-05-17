source ~/.config/nvim/vim-plug/plugins.vim
syntax enable
filetype plugin indent on
set number relativenumber
set ts=4 sts=4 sw=4 expandtab
set wrap
set nobackup noswapfile noundofile
set autoread

let g:rainbow_active = 1

" Colors
colorscheme material
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
set noshowmode

if (has("termguicolors"))
  set termguicolors
endif

if !has('nvim')
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

" Lightline
set hidden
set showtabline=2

let g:lightline = {
    \ 'colorscheme': 'material_vim',
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \   'filename': 'FilenameForLightline',
    \ },
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

let g:lightline_buffer_enable_devicons = 1
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']
let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20


function! FilenameForLightline()
    return expand('%')
endfunction

" Completion
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" LSP
lua << EOF
    require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
    require'lspconfig'.flow.setup{on_attach=require'completion'.on_attach}
    require'lspconfig'.yamlls.setup{on_attach=require'completion'.on_attach}
    require'lspconfig'.tsserver.setup{
        on_attach=require'completion'.on_attach;
        filetypes = {"typescript", "typescriptreact", "typescript.tsx"};
    }
EOF

" Key Bindings
let mapleader = ";"
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>n <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>p <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <c-l> :bn<CR>
nnoremap <c-h> :bp<CR>
nnoremap <c-p> :Files<CR>
nnoremap <c-f> :Rg<CR>
nnoremap <c-g> :Commits<CR>

" netrw
let loaded_netrwPlugin   = 1
" let g:netrw_banner       = 0
" let g:netrw_keepdir      = 0
" let g:netrw_liststyle    = 3
" let g:netrw_sort_options = 'i'
" let g:netrw_browse_split = 0

" ALE
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" FZF
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '40%' }

" LF
let g:lf_map_keys = 0

" TODO: why it opens in split panel?
map <c-t> :LfWorkingDirectoryExistingOrNewTab<CR>

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
