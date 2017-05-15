"Behave like windows
source $VIMRUNTIME/mswin.vim
behave mswin


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-rooter'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dansomething/vim-eclim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " some time this cause issue if you install fzf in different source e.g. brew install. To solve you need to brew reinstall
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/wombat256.vim'
" Plug 'mhinz/vim-grepper'
Plug 'danro/rename.vim'
Plug 'vim-scripts/grep.vim'
Plug 'airblade/vim-gitgutter' " Show git diff
Plug 'rhysd/conflict-marker.vim'

" Deplete companions
Plug 'zchee/deoplete-jedi' " Python
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "Javascript
" Plug 'Quramy/tsuquyomi'
Plug 'HerringtonDarkholme/yats.vim' " typescript syntax
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Gist.vim' "Gist but before git config --global github.user Username
Plug 'mattn/webapi-vim' 
Plug 'mattn/emmet-vim' " c-y ,
Plug 'tomtom/tcomment_vim' " gc
Plug 'dhruvasagar/vim-table-mode' " for better table in markdown, :TableModeToggle and || to start, you can even tableize the csv style entries and do table formula, delete column localleader=\\
Plug 'mattn/calendar-vim' " Good to have a calendar view
Plug 'plasticboy/vim-markdown' " gx ge note some font (like my favorite nerd font) doesn't have bold, italic etc.
Plug 'vimwiki/vimwiki' " Great tool! I think it's better than org mode I tried
Plug 'vim-scripts/utl.vim' " Utl help open URL in netrw
" Plug 'jceb/vim-orgmode' " Org mode for todo management
" Plug 'tybenz/vimdeck' " Presentation tool
" Plug 'artur-shaik/vim-javacomplete2' "Java
" Plug 'mhartington/nvim-typescript' " should do npm install -g typescript now causing problems and freeze vim
"Plug 'daizeng1984/my-worddoctor' " My own python plugin currently in test
"Plug 'ramele/agrep'
"Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'itchyny/calendar.vim' " Interesting to try out, Google Calendar in vim!

" Add plugins to &runtimepath
call plug#end()

" Plugin setting

" Deoplete

" autocmd FileType java setlocal omnifunc=javacomplete#Complete " Java Complete 2, with eclim enable this can be disabled
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" Jedi make it easier! autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType javascript setlocal omnifunc=tern#Complete

let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}
" When Eclim is available, we will use eclim!
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
" let g:deoplete#omni_patterns.java = '\%(\h\w*\|)\)\.\w*'
let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:deoplete#omni_patterns.scala = '[^. *\t]\.\w*\|: [A-Z]\w*'
" let g:deoplete#omni_patterns.typescript = '[^. \t0-9]\.([a-zA-Z_]\w*)?'

let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1

" let g:deoplete#enable_debug = 1
" let g:deoplete#enable_profile = 1
" call deoplete#enable_logging('DEBUG', './deoplete.log')

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

" Grepper, hard to config for my use search(pattern, folder, filepattern), and a few segment fault suspects
" let g:grepper = {
"       \ 'tools': ['grep', 'git', 'ag', 'vimgrep'] }


" Deoplete companion Language
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

" Scala
let g:scala_scaladoc_indent = 1

" Vim markdown
let g:vim_markdown_fenced_languages = ['html', 'java', 'cpp', 'python=py', 'bash=sh']
let g:vim_markdown_autowrite = 1
let g:vim_markdown_folding_style_pythonic = 1

" Vim Wiki
let g:vimwiki_list = [{'path': '~/Google Drive/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding = 'expr'

" whD
let g:deoplete#sources#whd#learning_texts = ['${HOME}/obama08.txt', '/']
