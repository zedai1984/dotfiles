let mapleader = ","

" Eclim, TODO: make a switch
map <silent> <leader>ji :JavaImport<CR>
map <silent> <leader>jc :JavaDocComment<CR>
map <F5> :Java %<CR>
map <C-]> :JavaSearch<CR>
map <silent> <leader>jdb :call MyEclimdJavaDebug()<CR>
map <F9> :JavaDebugBreakpointToggle<CR>:JavaDebugStatus<CR>
map <F8> :JavaDebugStep over <CR> :JavaDebugStatus<CR>
map <F7> :JavaDebugStep into <CR> :JavaDebugStatus<CR>

" Buffer switch
map <silent> <leader>bt :enew<CR>
" Doesn't work fix temporarily see https://github.com/neovim/neovim/issues/2048
" map <silent> <C-h> :bnext<CR>
map <silent> <BS> :bprevious<CR>
map <silent> <C-l> :bnext<CR>
map <silent> <leader>bq :bp <BAR> bd # <CR>

" Clear swp files
map <silent> <leader>wp :!find . -name ".*.*.swp" <Bar> xargs rm -rf<cr>

"WinManager
" let g:winManagerWindowLayout='TagList'
" map <silent> <leader>wm :WMToggle<CR>
map <silent> <leader>we :Explore<CR>

"BuffExplorer
" map <silent> <leader>wb :BufExplorer<CR>

"FuzzyFinder
"Find file
imap <C-L> <plug>(fzf-complete-line)
map <silent> <leader>wf :FZF --reverse<CR>
map <silent> <leader>w, :?<CR>
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction
map <silent> <leader>wb :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2,
\   'up': '~50%'
\ })<CR>


" Diff
nmap <leader>d :diffupdate<CR>zm
nmap <leader>dp :.diffput<CR>:diffupdate<CR>zm
nmap <leader>dg :diffget<CR>:diffupdate<CR>zm

" Grep
nnoremap <silent> <C-F> :Rgrep<CR>
map <silent> <leader>ff :Find<Space>

" SSH paste
map <silent> <leader>sp :r /tmp/sshclipboard.txt<CR>

" Terminal
tnoremap <silent> <Esc> <C-\><C-n><bar>:q<CR>
map <silent> <leader>tt :call TermEnter()<CR>
