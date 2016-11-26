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

"ステータスラインを常に表示
set laststatus=2

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
"call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
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
