source ~/.config/nvim/vim-plug/plugins.vim

syntax enable
filetype plugin indent on
set number relativenumber
set ts=4 sts=4 sw=4 expandtab
set wrap
set nobackup noswapfile noundofile

let g:rainbow_active = 1

" Colors
colorscheme material
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'material_vim',
    \ 'component_function': {
    \   'filename': 'FilenameForLightline'
    \ }
    \ }

" Completion
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" LSP
lua require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.flow.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.yamlls.setup{on_attach=require'completion'.on_attach}

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
nnoremap <c-l> :tabnext<CR>
nnoremap <c-h> :tabprevious<CR>
nnoremap <c-p> :GFiles<CR>
nnoremap <c-f> :Rg<CR>
nnoremap <c-g> :Commits<CR>

" ALE
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" FZF
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '40%' }

" LF
let g:lf_map_keys = 0
let g:lf_replace_netrw = 1
map <leader>f :LfWorkingDirectoryNewTab<CR>
" TODO: open tab not in split panel
" TODO: setup ~/.config/lf/lfrc
