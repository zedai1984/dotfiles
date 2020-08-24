" Plugin setting

" Deoplete

" autocmd FileType java setlocal omnifunc=javacomplete#Complete " Java Complete 2, with eclim enable this can be disabled
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" " Jedi make it easier! autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" autocmd FileType c setlocal omnifunc=ccomplete#Complete
" autocmd FileType javascript setlocal omnifunc=tern#Complete

let g:deoplete#enable_at_startup = 1

" let g:deoplete#omni_patterns = {}
" " When Eclim is available, we will use eclim!
" let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
" " let g:deoplete#omni_patterns.java = '\%(\h\w*\|)\)\.\w*'
" let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:deoplete#omni_patterns.scala = '[^. *\t]\.\w*\|: [A-Z]\w*'
" " let g:deoplete#omni_patterns.typescript = '[^. \t0-9]\.([a-zA-Z_]\w*)?'
"
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = []
" let g:deoplete#auto_completion_start_length = 2
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#enable_smart_case = 1

" let g:deoplete#enable_debug = 1
" let g:deoplete#enable_profile = 1
" call deoplete#enable_logging('DEBUG', './deoplete.log')

" EchoDoc
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
" Always draw the signcolumn.
set signcolumn=yes


" Ultisnips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" Fuzzy Find for neovim
" TODO: filter file type e.g. binary file
" - down / up / left / right
let g:fzf_layout = { 'up': '~50%' }
" Rely on fd
let $FZF_DEFAULT_COMMAND = '( fd --type f --hidden --follow --exclude .git || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null' 

" In Neovim, you can set up fzf window using a Vim command
" Customize fzf colors to match your color scheme
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.


" BufExplorer
let g:bufExplorerDisableDefaultKeyMapping=1

" VimAirline
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" 

" Wombat!
colorscheme wombat256mod
hi Normal ctermbg=none

" Grepper
let g:grepper = {
    \ 'tools': ['ag', 'git', 'rg'],
    \ 'ag': {
    \   'grepprg':    'ag --hidden -p ~/.config/nvim/.agignore --vimgrep',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ },
    \ 'rg': {
    \   'grepprg':    'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" ',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \   'wordanchors': ['', ''],
    \ }
    \}
let g:grepper.quickfix = 0


" Deoplete companion Language

" Scala
let g:scala_scaladoc_indent = 1

" Vim markdown
let g:vim_markdown_fenced_languages = ['html', 'java', 'cpp', 'python=py', 'bash=sh']
let g:vim_markdown_autowrite = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vimwiki_conceallevel=0
let g:taskwiki_disable_concealcursor=1 " Disable the override 

" Vim table mode conflict to vimwiki (https://github.com/dhruvasagar/vim-table-mode/issues/110)
let g:vimwiki_table_mappings = 0
autocmd FileType vimwiki setlocal commentstring="> %s"

" Vim/Task Wiki
let g:vimwiki_list = [{'path': '~/Workspace/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding = 'expr'
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.config/nvim/my-snippets/UltiSnips"]

" whD
let g:deoplete#sources#whd#learning_texts = ['${HOME}/obama08.txt', '/']

" Far Note ag etc. doesn't support multiline replacement
let g:far#source = 'rg'

" Ipy
let g:nvim_ipy_perform_mappings = 0

" Rooter
let g:rooter_manual_only = 1

" LargeFile
let g:LargeFile = 5

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=237
hi IndentGuidesEven ctermbg=234


" Gitgutter
autocmd BufWritePost * GitGutter

" LSP
if g:use_native_lsp
lua <<EOF
require'nvim_lsp'.bashls.setup{}
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.dockerls.setup{}
EOF
" install pyls conda install -y -c conda-forge python-language-server

" ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_set_quickfix = 1

else
endif
