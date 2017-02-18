" タブの代わりに空白文字を挿入する(http://nanasi.jp/articles/howto/editing/et-inserttab.html)
set expandtab
" タブを文字何文字分とみなすかの設定(http://peacepipe.toshiville.com/2006/05/vimrc-vim.html)
set ts=4 sw=4 sts=0
" ファイル名補完時の操作と表示の設定(http://boscono.hatenablog.com/entry/2013/11/17/230740)
set wildmode=longest:full,full

"バックアップファイルを作るディレクトリ(http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html)
set backupdir=$HOME/.vim/backup
"スワップファイル用のディレクトリ
set directory=$HOME/.vim/swp

"インクリメンタルサーチを行う(http://nanasi.jp/articles/howto/note/top10-viuser-need-to-know-about-vim.html)
set incsearch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"C言語スタイルのインデント機能を有効にする
set cindent
"タブ文字、行末など不可視文字を表示する(http://blog.remora.cx/2011/08/display-invisible-characters-on-vim.html)
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"クリップボードを連携(http://nanasi.jp/articles/howto/editing/clipboard.html)
set clipboard+=autoselect

"ファイル書き込み時の文字コード(http://qiita.com/take4s5i/items/a347be456b2f1312150)
set fileencoding=utf-8
"読み込み時の文字コード
set fileencodings=utf-8,cp932

"カーソルラインを表示する(http://qiita.com/koara-local/items/57b5f2847b3506a6485b)
set cursorline

"ルーラー,行番号を表示
set ruler
set number

" lightline.vim を使用するための設定
" ステータスラインを常に表示
set laststatus=2

" ターミナル上で 256 色使うための設定
set t_Co=256

nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" 全角スペースの表示(http://inari.hatenablog.com/entry/2014/05/05/231307)
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""


" dein.vim 設定
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/umemoto/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/umemoto/.vim/dein')

" Let dein manage dein
" Required:
call dein#load_toml('~/.vim/dein/toml/plugins.toml', {'lazy': 0})
call dein#load_toml('~/.vim/dein/toml/plugins-lazy.toml', {'lazy': 1})
" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" neocomplete デフォルト設定(https://github.com/Shougo/neocomplete.vim)
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" 自動補完時に出力される preview を抑制する設定(https://github.com/fatih/vim-go/issues/415)
set completeopt-=preview

