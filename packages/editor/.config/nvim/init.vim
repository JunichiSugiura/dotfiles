source ~/.config/nvim/vim-plug/plugins.vim
syntax enable
filetype plugin indent on
set number relativenumber
set ts=4 sts=4 sw=4 expandtab
set wrap
set nobackup noswapfile noundofile
set autoread
set mouse=a

let g:rainbow_active = 1

" Colors
colorscheme ghdark
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
    \ 'colorscheme': 'one',
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

" File Detection
au BufNewFile,BufRead Fastfile set ft=ruby

" LSP
lua << EOF
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "rust_analyzer",
            "solang",
            "eslint",
            "tsserver",
        },
        automatic_installation = true,
    })

    require("lspconfig").rust_analyzer.setup{}

    local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
            filter = function(client)
                -- apply whatever logic you want (in this example, we'll only use null-ls)
                return client.name == "null-ls"
            end,
            bufnr = bufnr,
        })
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end

    require("null-ls").setup({
        sources = {
            require("null-ls").builtins.formatting.rustfmt,
            require("null-ls").builtins.diagnostics.solhint,
            require("null-ls").builtins.code_actions.eslint,
            require("null-ls").builtins.code_actions.shellcheck,
        },
        on_attach = on_attach,
    })
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

" FZF
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '100%' }

" LF
let g:lf_map_keys = 0
let g:lf_width = 1.0
let g:lf_height = 1.0
map <c-t> :Lf<CR>
map <s-t> :LfWorkingDirectory<CR>

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

autocmd BufNewFile,BufRead Podfile set filetype=ruby
