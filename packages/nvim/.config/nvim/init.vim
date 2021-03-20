source ~/.config/nvim/vim-plug/plugins.vim

syntax enable
filetype plugin indent on
set number relativenumber
set ts=4 sts=4 sw=4 expandtab
set wrap
set nobackup
set noswapfile
set noundofile

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


" NERDTree
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeQuitOnOpen = 1

let g:rainbow_active = 1

let g:ctrlp_show_hidden = 1

function! FilenameForLightline()
    return expand('%')
endfunction

" Completion
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" LSP
lua require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.flow.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.yamlls.setup{on_attach=require'completion'.on_attach}

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" ALE
let g:ale_fix_on_save = 1
