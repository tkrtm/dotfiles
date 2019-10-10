augroup MyAutoCmd
  autocmd!
augroup END

let $PATH = expand("$HOME/.local/pyenv/shims:").$PATH

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" {{{ dein
let s:dein_dir = expand('$DATA/dein')

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif


" dein.vim settings

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = expand('$CONFIG/dein')

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
"    if has('python3')
"        call dein#load_toml(s:toml_dir . '/python.toml', {'lazy': 1})
"    endif

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}
"

" python
function! s:pick_executable(pathspecs) abort
  for pathspec in filter(a:pathspecs, '!empty(v:val)')
    for path in reverse(glob(pathspec, 0, 1))
      if executable(path)
        return path
      endif
    endfor
  endfor
  return ''
endfunction

if has('nvim')
  let g:python_host_prog = s:pick_executable([
        \ '/usr/local/bin/python2',
        \ '/usr/bin/python2',
        \ '/bin/python2',
        \])
  let g:python3_host_prog = s:pick_executable([
        \ '/usr/local/bin/python3',
        \ '/usr/bin/python3',
        \ '/bin/python3',
        \])
endif

"------------------------------------------
" setting
"------------------------------------------
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set guicursor=
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<

" autocmd FileType python setlocal completeopt-=preview " no docstring
set completeopt-=preview

"----------------------------------------------------------------------------------------------------
"search
"----------------------------------------------------------------------------------------------------
set wrapscan "最後まで検索したら先頭へ戻る
set ignorecase "大文字小文字無視
set smartcase "検索文字列に大文字が含まれている場合は区別して検索
set hlsearch

"----------------------------------------------------------------------------------------------------
"keybind
"----------------------------------------------------------------------------------------------------
nmap <ESC><ESC> :nohl<CR><ESC>
tnoremap <silent> <ESC> <C-\><C-n>

command! -nargs=0 CDCurrent cd %:p:h
command! ClearQuickFixList cexpr []
