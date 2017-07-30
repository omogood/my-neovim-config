" -------------
" Vim の基本設定
" -------------
" 行番号
set number

" シンタックス
if has("syntax")
	syntax on
endif

" タイトル
set title

" 文脈によって解釈が異なる全角文字の幅を、2に固定
set ambiwidth=double

" タブ幅をスペース4つ分にする
set tabstop=4

" vim が自動生成（読み込み時）に使用するタブ幅を4つ分とする
set shiftwidth=4

" タブ入力を複数空白に置き換える
set expandtab

" 空白文字の可視化
set list

" 可視化した空白文字の表示形式
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 全角スペースを表示
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkRed
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" Font の設定
"set guifont=SourceCodePro-Medium:h15
set guifont=RictyDiminished-Regular:h15

" 検索結果のハイライthisト
set hlsearch

" 改行時などに、自動でインデントを設定してくれる
set smartindent

" 0で始まる数値を、8進数として扱わないようにする
"set nrformats-=octal

" カーソルの回り込みができるようになる
set whichwrap=b,s,[,],<,>

" ファイル名の補完の可視化
set wildmenu

" ファイル名を常に表示
set laststatus=2

" クリップボードの共有
set clipboard=unnamed

" バックアップファイルを作成しない
set nobackup

" terminal emulator を zsh に変更
set sh=zsh

" terminal emulator でコマンドモードに移行するキーマップ
tnoremap <silent> <ESC> <C-\><C-n>


" sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
if has("autocmd")
	filetype indent on
	autocmd FileType html	setlocal sw=2 sts=2 ts=2 et
	autocmd FileType css	setlocal sw=2 sts=2 ts=2 et
    "autocmd BufRead,bufNewFile *.ex setfiletype elixir
    autocmd FileType elixir setlocal sw=2 sts=2 ts=2 et
endif

" pyenv でPython3 を入れてるからこの設定を行う。
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" インサートモードのキーマップ設定
" オムニ変換を再割り当て
inoremap <C-n> <C-x><C-o>

" keymap の再設定
let mapleader = "\<Space>"
nnoremap <silent> <Leader>tt :tabnew<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
" 保存と間違えてこっちを起動してしまうことがあるから一旦割り当てを解除しておく
"nnoremap <silent> <Leader>e :e.<CR>
nnoremap <silent> <Leader>ss :split<CR>
nnoremap <silent> <Leader>vs :vsplit<CR>

" ノーマルモードで; と : を入れ替える
nnoremap ; :
nnoremap : ;

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" ESC キーを Control + j に割り当てる 
imap <C-j> <Esc>

" **********************
" キーマッピング
" **********************
" 特定のキーに行頭および行末の回り込み移動を許可する設定
" b  [Backspace]    ノーマルモード	ビジュアルモード
" s  [Space]        ノーマルモード	ビジュアルモード
" <  [←]           ノーマルモード	ビジュアルモード
" >  [→]           ノーマルモード	ビジュアルモード
" [  [←]           挿入モード      置換モード
" ]  [→]           挿入モード      置換モード
" ~                 ノーマルモード
set whichwrap=b,s,[,],<,>,~

" カラースキームの設定
" color scheme [hybrid] の設定
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme hybrid

set t_Co=256

" TrueColor 対応
set termguicolors

" Font の設定
set guifont=SourceCodePro-Medium:h15

set runtimepath+=~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim
runtime! userautoload/*.vim

if &compatible
	set nocompatible
endif

" --- vim-plug を使ったパッケージ管理
call plug#begin()
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Golang
Plug 'fatih/vim-go'

" elm 言語
Plug 'elmcast/elm-vim'
" Rust 言語
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Riot.js
Plug 'ryym/vim-riot'
call plug#end()

" deoplete を使用する
:let g:deoplete#enable_at_startup = 1

filetype plugin indent on

" deoplete を使用する
let g:deoplete#enable_at_startup=1

" golang の設定
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1

" --- rust-lang の設定 ---
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
set hidden
let g:racer_command = '$HOME/.cargo/bin/racer'


