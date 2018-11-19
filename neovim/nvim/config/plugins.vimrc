"Behave like windows
source $VIMRUNTIME/mswin.vim
behave mswin 
" Check if a cli is there 
function! CliInstalled(cond) 
    return system("if ! type " . a:cond . " > /dev/null 2>&1; then echo '0'; else echo '1'; fi")
endfunction

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': 'pip install typing' }
Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-rooter' " User :Rooter to do it manually
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Language autocomplete
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Disable for languageclient-neovim
" if CliInstalled('eclipse')
" Plug 'dansomething/vim-eclim', { 'for' : ['java', 'scala']} " Annoying 'unable to determine the project ...' for file like html
" else
" Plug 'artur-shaik/vim-javacomplete2', { 'for' : ['java']}
" endif
" Disable for languageclient-neovim

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " some time this cause issue if you install fzf in different source e.g. brew install. To solve you need to brew reinstall
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/wombat256.vim'
" Plug 'mhinz/vim-grepper'
Plug 'danro/rename.vim' " :Rename
Plug 'vim-scripts/grep.vim' " when you cannot use rg
Plug 'eugen0329/vim-esearch' " rg
Plug 'airblade/vim-gitgutter' " Show git diff
Plug 'rhysd/conflict-marker.vim'
set previewheight=20
Plug 'tpope/vim-fugitive' " -, dv, U, cc, cA, p, q
Plug 'gregsexton/gitv' "extension to fugitive
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim' " c-y ,then type this>is>tag ---> <this> <is> <tag> ... </.... or type insert mode and c-y , here's the cheatsheet https://docs.emmet.io/cheat-sheet/
Plug 'tomtom/tcomment_vim' " gc toggle comment
Plug 'mattn/webapi-vim' " Gist dependencies
Plug 'vim-scripts/Gist.vim' "Gist but before git config --global github.user Username
Plug 'vim-scripts/BufOnly.vim' " BufOnly to close all but this
Plug 'sheerun/vim-polyglot' " One to rule them all, one to find them, one to bring them all and in the darkness bind them.
Plug 'vim-scripts/LargeFile' " Load largefile without syntax etc. burden
Plug 'AndrewRadev/linediff.vim' " :Linediff for two blocks
Plug 'brooth/far.vim' " Easier Search&Replace :Far number num <tab>for hint and then vola! Use x to exclude and X to exclude for all, i for include and I for ... Far also works for virtual block!
Plug 'djoshea/vim-autoread' " Auto reload when changed by other app
Plug 'kshenoy/vim-signature' " Added color vis for marks
" Plug 'rking/ag.vim' " Test
Plug 'bronson/vim-visual-star-search' " Case sensitive * in virtual mode
Plug 'tpope/vim-ragtag' " complete words with tag! :help ragtag
Plug 'scrooloose/nerdtree' " NERDtree, even though know it for a while, usually my flow doesn't include much file exploring
Plug 'Xuyuanp/nerdtree-git-plugin' " git flag in NERDTree

" Deplete companions
Plug 'justinj/vim-react-snippets'
Plug 'neomake/neomake'

" Markdown plugins
Plug 'dhruvasagar/vim-table-mode', {'for': ['markdown'] } " for better table in markdown, :TableModeToggle and || to start, you can even tableize the csv style entries and do table formula, delete column localleader=\\
Plug 'mattn/calendar-vim', {'for': ['markdown'] } " Good to have a calendar view
Plug 'vimwiki/vimwiki' " Great tool! I think it's better than org mode I tried
Plug 'vim-scripts/utl.vim', {'for': ['markdown'] } " Utl help open URL in netrw
Plug 'powerman/vim-plugin-AnsiEsc', {'for': ['markdown'] }  " allow colorful chart in taskwiki
Plug 'ap/vim-css-color' " Color for CSS
Plug 'jamessan/vim-gnupg' " Encryptize transparently error informations
" Stop the complaining due to taskwarrior not installed
if CliInstalled('task')
Plug 'tbabej/taskwiki', {'for': ['markdown'], 'on': 'VimwikiIndex', 'do': 'pip install --upgrade git+git://github.com/tbabej/tasklib@develop' }
Plug 'blindFS/vim-taskwarrior', {'for': ['markdown'], 'on': 'VimwikiIndex' }  " For grid view of taskwiki
endif
" Plug 'rhysd/nyaovim-markdown-preview', {'for': ['markdown'] }  " Nayovim GUI preview for markdown
" Plug 'tybenz/vimdeck' " Presentation tool

" Python
Plug 'nathanaelkane/vim-indent-guides' " Indention guide
if CliInstalled('ipython')
Plug 'bfredl/nvim-ipy', { 'do': 'pip install jupyter' } " Jupyter/IPython
endif
if CliInstalled('notedown')
Plug 'goerz/ipynb_notedown.vim', { 'do': 'pip install notedown' } " Install notedown to write ipynb in vim
endif

"Plug 'daizeng1984/my-worddoctor' " My own python plugin currently in test
Plug 'daizeng1984/vim-feeling-lucky', {'do': 'pip install --upgrade google-api-python-client' } " require google api
Plug 'daizeng1984/vim-snip-and-paste'

"Plug 'ramele/agrep'
"Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'itchyny/calendar.vim' " Interesting to try out, Google Calendar in vim!

" Add plugins to &runtimepath
call plug#end()

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

" Super Tab enable as alternative to avoid annoying eclim error popping up when deoplete automatically
" queries it
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Ultisnips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" Add eclimd support
let g:EclimCompletionMethod = 'omnifunc'
" for airline
let g:airline#extensions#eclim#enabled = 1
highlight DebugBreak ctermfg=0 ctermbg=226
let g:EclimLineHighlightDebug = 'DebugBreak'
" let g:EclimJavaDebugLineSignText = '->'

" Fuzzy Find for neovim
" TODO: filter file type e.g. binary file

" - down / up / left / right
let g:fzf_layout = { 'up': '~50%' }
" TODO: change to rg
let $FZF_DEFAULT_COMMAND = 'ag --hidden -p ~/.config/nvim/.agignore -l -g ""'

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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" 

" Wombat!
colorscheme wombat256mod
hi Normal ctermbg=none

" Grepper, hard to config for my use search(pattern, folder, filepattern), and a few segment fault suspects
" let g:grepper = {
"       \ 'tools': ['grep', 'git', 'ag', 'vimgrep'] }


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

" ESearch
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'qflist',
  \ 'batch_size': 1000,
  \ 'use':        ['word_under_cursor', 'visual', 'hlsearch', 'last'],
  \}

" Far
" let g:far#source = 'agnvim' " Note ag etc. doesn't support multiline replacement

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

" LanguageClient neovim
let g:LanguageClient_serverCommands = {
    \ 'java': [$HOME.'/.dotfiles/.local/bin/jdtls'],
    \ 'javascript': [$HOME.'/.dotfiles/.local/lib/js-language-server/node_modules/.bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': [$HOME.'/.dotfiles/.local/lib/js-language-server/node_modules/.bin/javascript-typescript-stdio'],
    \ 'typescript': [$HOME.'/.dotfiles/.local/lib/js-language-server/node_modules/.bin/javascript-typescript-stdio'],
    \ 'python': [$HOME.'/.dotfiles/.local/lib/python-language-server/bin/pyls'],
    \ 'cpp': [$HOME.'/.dotfiles/.local/bin/clangd'],
    \ 'sh': [$HOME.'/.dotfiles/.local/lib/bash-language-server/node_modules/.bin/bash-language-server', 'start'],
    \ }
" \ 'cpp': [$HOME.'/.dotfiles/.local/bin/cquery'],
" Doublecheck in case any of these servers are not working
" Here we add some environment necessary to run up pyls
let $PYTHONPATH .= ":".$HOME."/.dotfiles/.local/lib/python-language-server/lib/python/site-packages/"
