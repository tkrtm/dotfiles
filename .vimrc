" ~/.silversearcher-agvimrc (configuration file for vim only)

source ~/.vimrc.path
"--------------------------------------------------------------------------------------------------- 
" pyclewn
" ---------------------------------------------------------------------------------------------------
let g:pyclewn_args = "--pgm=/home/takeru/xarina/xarina_e/release/ain1e/tools/gnu/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/armv6-vfp-wrs-linux-gnueabi/arm-wrs-linux-gnueabi-gdb"

"--------------------------------------------------------------------------------------------------- 
" neobunele
" ---------------------------------------------------------------------------------------------------
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'


" Required:
filetype plugin indent on " 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
"

"NeoBundle 'Yggdroot/indentLine'
"let g:indentLine_faster = 1
"let g:indentLine_char = 
"nmap <silent><Leader>i :<C-u>IndnetLinesToggle<CR>

" NeoComplete --------------------
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neopairs.vim'
NeoBundle 'ujihisa/neco-look'
"NeoBundle 'pocke/neco-gh-issues'
"NeoBundle 'Shougo/neco-syntax'
source ~/.vimrc.neocomplete
" --------------------------------



NeoBundle 'Shougo/unite.vim', {
     \ "autoload":{
     \    "commands": ["Unite", "UniteWithBufferDir"]
     \ }}

NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
"NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'kana/vim-altr'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'
"NeoBundle 'osyo-manga/unite-quickfix'

"NeoBundle 'chazy/cscope_maps'

" Leader
"let mapleader = ";"

"ColorScheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'vim-scripts/rdark'

NeoBundle 'vim-jp/cpp-vim'

" python completion
NeoBundleLazy "davidhalter/jedi-vim", {
	\ "autoload": {
	\   "filetypes": ["python", "python3"],
	\ },
	\ "build": {
	\    "mac": "pip install jedi",
	\    "unix": "pip install jedi --proxy=proxy.hq-other.sony.co.jp:10080",
	\}}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
    " jediにvimの設定を任せると'completeopt+=preview'するので
    " 自動設定機能をOFFにし手動で設定を行う
    let g:jedi#auto_vim_configuration = 0
    " 補完の最初の項目が選択された状態だと使いにくいためオフにする
    let g:jedi#popup_select_first = 0
    " quickrunと被るため大文字に変更
    "let g:jedi#rename_command = '<Leader>R'
    "gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
    "let g:jedi#goto_command = '<Leader>G'
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
    setlocal omnifunc=jedi#completions
    setlocal completeopt-=preview
    setlocal expandtab
endfunction

NeoBundle 'hdima/python-syntax'
let python_highlight_all = 1

" Python Checker
NeoBundle 'scrooloose/syntastic'
"let g:syntastic_python_chekers = ['pyflakes', 'pep8']
"let g:syntastic_python_chekers = ['flake8']

"NeoBundle 'tell-k/vim-autopep8'

"  function Preserve(command)
"  	"Save the last search.
"  	let search = @/
"  	"Save the current cursor pos
"  	let cursor_position = getpos('.')
"  	"save the current window pos
"  	normal! H
"  	let window_position = getpos('.')
"  	call setpos('.', cursor_position)
"  	"Execute the command.
"  	execute a:command
"  	"Restore the last search
"  	let @/ = search
"  	call setpos(".", window_position)
"  	normal! zt
"  	call setpos(".", cursor_position)
"  endfunction
"  
"  function! Autopep8()
"  	call Preserve(':silent %!autopep8 -')
"  endfunction

"NeoBundle 'nathanaelkane/vim-indent-guides'
"indent-guides
"let s:hooks = neobundle#get_hooks("vim-indent-guides")
"function! s:hooks.on_source(bundle)
"	let g:indent_guides_guide_size = 1
"	IndentGuidesEnable
"endfunction


"" gtags
NeoBundle 'hewes/unite-gtags'


"NeoBundle 'vim-scripts/gtags.vim'
"nnoremap <C-j> :<C-u><CR>

NeoBundle 'rhysd/vim-clang-format'
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
nmap <Leader>C :ClangFormatAutoToggle<CR>

call neobundle#end()

" marching
source ~/.vimrc.marching

" altr
nmap <F2> <Plug>(altr-forward)
nmap <S-F2> <Plug>(altr-back)

"
"----------------------------------------------------------------------------------------------------
" let mapleader = '\<Space>'

set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set formatoptions=lmoq              "テキスト整形オプション, マルチバイト系を追加
set scrolloff=5
set autoread
set notitle
set clipboard=unnamed
set helplang=ja,en

syntax enable
set t_Co=256
"set background=dark
colorscheme mustang

command! -nargs=0 CdCurrent cd %:p:h

"
" quickfix
"
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-S-b> :b#<CR>

"----------------------------------------------------------------------------------------------------
" unite
"----------------------------------------------------------------------------------------------------
nnoremap [unite] <Nop>
nmap <Space> [unite]
noremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap [unite]g :<C-u>Unite<Space>grep<CR>

"unite-grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

"VimFiler
noremap <silent> <Leader>e :<C-u>VimFiler -split -simple -winwidth=40 -toggle -no-quit<CR>


"unite gtags
nnoremap [unite]g :<C-u>Unite gtags/
nnoremap [unite]gj :<C-u>Unite gtags/def<CR>
nnoremap [unite]gc :<C-u>Unite gtags/context<CR>
nnoremap [unite]gr :<C-u>Unite gtags/ref<CR>
nnoremap [unite]gg :<C-u>Unite gtags/grep<CR>

"let g:unite_source_gtags_project_config = {
"  \   '/home/takeru/xarina/': {
"  \     'treelize': 1,
"  \     'gtags_libpath': [ '/usr/local/poky1.8/sysroots/armv6-vfp-poky-linux-gnueabi/usr/include/' ]
"  \   },
"  \   '_': { 
"  \     'treelize': 0,
"  \     'gtags_libpath': [ '/usr/include/' ]
"  \   }
"  \ }
"
"----------------------------------------------------------------------------------------------------
" for C, C++ 
"----------------------------------------------------------------------------------------------------
source ~/.vimrc.path

"if has('cscope')
"	set cscopetag
"	set cscopetagorder=0
"	set cscopequickfix=s-,c-,d-,i-,t-,e-
"
"	"for xarina
"	for targetpath in split(&path, ',')
"		let i = 0
"		while targetpath != ''
"			if filereadable(targetpath . '/cscope.out')
"				execute 'cscope add ' . targetpath . '/cscope.out ' . targetpath
"			endif
"			let targetpath =  fnamemodify(targetpath, ':h')
"			if targetpath == '.' || targetpath == '/'
"				let targetpath = ''
"			endi
"		endwhile
"	endfor
"endif

"----------------------------------------------------------------------------------------------------
"appearance and basic
"----------------------------------------------------------------------------------------------------
set title
set display=uhex
set number
set ruler
set ruf=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
set showcmd
set showmode
set cmdheight=2 "コマンドラインに使われるスクリーン上の行数
set laststatus=2 "エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set wildmenu "コマンドライン補完を拡張モードにする
set textwidth=0
set wrap
set cursorline

set fileencodings=utf-8,euc-jp,iso-2022-jp,utf-8,cp932
if &encoding == 'utf-8'
	set ambiwidth=double
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
	match Zenkakuspace /　/
endif

set wildmenu
set wildmode=longest

"----------------------------------------------------------------------------------------------------
"edit
"----------------------------------------------------------------------------------------------------
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set tabstop=4
set softtabstop=4
set shiftwidth=4

" putline \line と打つ"
let putline_tw = 60
inoremap <Leader>line <ESC>:call <SID>PutLine(putline_tw)<CR>A
function! s:PutLine(len)
	let plen = a:len - strlen(getline('.'))
	if (plen > 0)
		execute 'normal ' plen . 'A-'
	endif
endfunction

"----------------------------------------------------------------------------------------------------
"search
"----------------------------------------------------------------------------------------------------
set wrapscan "最後まで検索したら先頭へ戻る
set ignorecase "大文字小文字無視
set smartcase "検索文字列に大文字が含まれている場合は区別して検索
set hlsearch
nmap <ESC><ESC> :nohl<CR><ESC>

autocmd QuickFixCmdPost *grep*,make,cscope* cwindow

"----------------------------------------------------------------------------------------------------
" skeletons
"----------------------------------------------------------------------------------------------------
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . t:r") . "/ge"
"base setting
	setf spec
endfunction
