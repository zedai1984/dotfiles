" terminal from https://github.com/jasonrsmith/dotfiles/blob/master/.vimrc#L268
" set switchbuf+=useopen
function! TermEnter()
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, "term://") > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
        break
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
" TODO: allow configuration of size and vertical/horizontal
  if(nummatches >= 1)
    execute ":belowright sbuffer ". firstmatchingbufnr
    startinsert
  else
    execute ":belowright sp | :terminal"
  endif
endfunction

" http://stackoverflow.com/questions/10394707/create-file-inside-new-directory-in-vim-in-one-step
function s:MKDir(...)
    if         !a:0 
           \|| stridx('`+', a:1[0])!=-1
           \|| a:1=~#'\v\\@<![ *?[%#]'
           \|| isdirectory(a:1)
           \|| filereadable(a:1)
           \|| isdirectory(fnamemodify(a:1, ':p:h'))
        return
    endif
    return mkdir(fnamemodify(a:1, ':p:h'), 'p')
endfunction
command -bang -bar -nargs=? -complete=file E :call s:MKDir(<f-args>) | e<bang> <args>

" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep

" Our Vim function
fu! MyEclimdJavaDebug()
    let filename = expand("%")
    let filename = substitute(filename, "\.java$", "", "")
    let dir = getcwd() . "/" . filename
    let dir = substitute(dir, "^.*\/src\/", "", "")
    let dir = substitute(dir, "\/[^\/]*$", "", "")
    let dir = substitute(dir, "\/", ".", "g")
    let filename = substitute(filename, "^.*\/", "", "")
    execute ":! java  -Xdebug -agentlib:jdwp=transport=dt_socket,address=9999,server=y,suspend=y -classpath ./bin ".dir.".".filename." & sleep 1.5"
    let g:server_addr = serverstart('EclimdDebug')
    execute ":JavaDebugStart localhost 9999"
endfunction

" Delete current file http://vim.wikia.com/wiki/Delete_files_with_a_Vim_command
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')


" Calendar action some stolen from 
let g:my#calendar_action#backup = ''
fun MyCalAction(day, month, year, week, dir)
    let datetime_date = printf("%d-%d-%d", a:year, a:month, a:day)
	exe "q"
    exe "normal! a".datetime_date."\el"
    let g:calendar_action = g:my#calendar_action#backup
    if col('.') == col('$') - 1
        startinsert! " `A`
    else
        normal l     " `l`
        startinsert  " `i`
    end
endf
fun MyInsertCalDate()
    let g:my#calendar_action#backup = g:calendar_action
    let g:calendar_action = 'MyCalAction'
    if !exists(':Calendar')
        echo "Please install plugin Calendar.vim"
    endif

    " call calendar
    echo "Open Calendar..."
    exe ":Calendar"
endf
