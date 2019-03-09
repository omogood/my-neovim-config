" -------------
" Vim の基本設定
" -------------
" 行番号
set number

" シンタックス
if has("syntax")
	"syntax on
    syntax enable
endif

" カレント行をハイライト
set cursorline

" タイトル
set title

" 検索時に大文字、小文字を無視する
set ignorecase

" 検索キーワードが小文字のみなら大文字、小文字を区別しない
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 文字列置換をインタラクティブに表示
set inccommand=split

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

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
set listchars=tab:>-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 全角スペースを表示
" :hi コマンドで設定状態を確認することができる。
augroup highlightIdegraphicSpace
  autocmd!
  " スペース、タブの色をグレーに変更
  autocmd Colorscheme * highlight NonText guifg=#444b71
  autocmd VimEnter,Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=#444b71
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" Font の設定
"set guifont=SourceCodePro-Medium:h15
"set guifont=RictyDiminished-Regular:h15
"set guifont=Monoisome-Regular:h15
"set guifont=FiraCode-Retina:h15
set guifont=Hack-Regular:h16

" 改行時などに、自動でインデントを設定してくれる
set smartindent

" 0で始まる数値を、8進数として扱わないようにする
"set nrformats-=octal

" ファイル名の補完の可視化
set wildmenu

" ファイル名を常に表示
set laststatus=2

" クリップボードの共有
set clipboard=unnamed

" バックアップファイルを作成しない
set nobackup

" terminal emulator を zsh に変更
"set sh=zsh
" terminal emulator を fish に変更
set sh=fish

" ビープ音とビジュアルベルを無効にする
set noerrorbells
set novisualbell
set vb t_vb=

" terminal emulator でノーマルモードに移行するキーマップ
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-j><C-j> <C-\><C-n>

" 

" keymap の再設定
let mapleader = "\<Space>"

" pyenv でPython3 を入れてるからこの設定を行う。
"let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python_host_prog = $PYENV_ROOT . '/versions/2.7.10/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
"let g:python3_host_prog = $PYENV_ROOT . '/versions/3.6.5/bin/python'

" インサートモードのキーマップ設定
" オムニ変換を再割り当て
inoremap <C-n> <C-x><C-o>

" ; と : を入れ替える
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" ESC の代替え
inoremap <silent><C-j><C-j> <esc>:w<CR>

" ハイライトの非表示
nnoremap <silent><ESC><ESC> :noh<CR>

" タブ移動
nnoremap <Leader>j gt
nnoremap <Leader>k gT

" 現在の行を上に動かす
"nnoremap <S-Up>  :<c-u>execute 'move -1-'. v:count1<cr>
" 現在の行を下に動かす
"nnoremap <S-Down>  :<c-u>execute 'move +'. v:count1<cr>

" ウィンドウのサイズを変更する
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-


" ウィンドウを上にスクロール
nnoremap <C-k> <C-y>
" ウィンドウを下にスクロール
nnoremap <C-j> <C-e>

" 対応する括弧への移動 Control+Enter
" <C-v><C-CR> で
" 文字を表示
nnoremap  %
vnoremap  %

" 検索コマンド
nnoremap <leader><CR> *

" delete コマンドのRe-map
inoremap <C-d> <del>


" quickfix: 編集許可と折り返し表示無効
function! OpenModifiableQF()
        copen
        set modifiable
        set nowrap
endfunction

autocmd QuickfixCmdPost vimgrep call OpenModifiableQF()
autocmd QuickfixCmdPost grep call OpenModifiableQF()

" Quickfix リスト: 次に移動
nnoremap <silent><A-n> :cn<CR>
" Quickfix リスト: 前に移動
nnoremap <silent><A-N> :cN<CR>

" augroup fileTypeSettings
"     autocmd!
"     autocmd BufRead, BufNewFile *.py nnoremap <silent><A-/> <S-i>#<ESC>:w<CR>
"     autocmd BufRead, BufNewFile *.rs nnoremap <silent><A-/> <S-i>//<ESC>:w<CR>
"     autocmd BufRead, BufNewFile *.go nnoremap <silent><A-/> <S-i>//<ESC>:w<CR>
" augroup END

nnoremap <A-l> :lvim /\<<C-r><C-w>\>/j % \|lw

" 外部 grep の設定
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
" grep 後にクイックフィックスリストが表示される
"autocmd QuickfixCmdPost grep copen
nnoremap <expr> <leader>g ':grep! ' . expand('<cword>') . ' *'
nnoremap <leader>G :grep! <C-r>* *

nnoremap <silent><leader>f /\V\<<C-r>*\><CR>
nnoremap <silent><leader>F /\V<C-r>*<CR>

" 単語選択
nnoremap <silent><leader><leader> viw
" yank
nnoremap <C-y> viwy
" paste
nnoremap <C-p> viwp
" Insert モード中にペースト
inoremap <C-v> <C-r>*
" Ex モード中にペースト
vnoremap <C-v> <C-r>*
" Terminal モード中にペースト
tnoremap <C-v> <C-r>*

" ファイルの保存
nnoremap <leader>w :w<CR>

" 新しいタブを開く
nnoremap <C-n> :tabnew<CR>


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

" 文章の改行表示を無効化（有効：wrap）
set nowrap

" カラースキームの設定
"colorscheme solarized

set t_Co=256

" TrueColor 対応
set termguicolors


"set runtimepath+=~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim
" 自作のプラグインを読み込ませる
"set runtimepath+=~/.config/nvim/my-plugin/neofinder/neofinder.vim
"runtime! userautoload/*.vim

if &compatible
	set nocompatible
endif

" --- vim-plug を使ったパッケージ管理
call plug#begin('~/.config/nvim/plugged')
" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" elm 言語
Plug 'elmcast/elm-vim'

" Rust 言語
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Python
Plug 'zchee/deoplete-jedi'

" vim-airline ステータスバーなどの見た目系
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ctags
Plug 'universal-ctags/ctags'

" Haskell
"Plug 'neovimhaskell/haskell-vim'

" TOML Syntax
Plug 'cespare/vim-toml'

" Color Scheme
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'

" Emmet
Plug 'mattn/emmet-vim'
call plug#end()


" vim-airline のオプション
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" vim-airline のテーマを設定
let g:airline_theme='one'

" Color Scheme の設定
"colorscheme one
colorscheme iceberg
set background=dark

filetype plugin indent on

" deoplete を使用する
let g:deoplete#enable_at_startup=1
"let g:deoplete#sources#rust#racer_binary = '$HOME/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path = '$HOME/rustlang_src/rust/src' 
"let g:deoplete#sources#rust#show_duplicates = 1
"let g:deoplete#sources#rust#disable_keymap=1

" golang の設定
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1

" --- rust-lang の設定 ---
autocmd BufReadPost *.rs setlocal filetype=rust
" バッファが編集中でも他のファイルを開けるようにする
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" ctags
set tags=./tags,tags;

" ファイル別の設定
" sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
"if has("autocmd")
augroup Init
    autocmd!
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css setlocal sw=2 sts=2 ts=2 et
    "autocmd BufRead,bufNewFile *.ex setfiletype elixir
    autocmd FileType elixir setlocal sw=2 sts=2 ts=2 et
    autocmd FileType haskell setlocal sw=2 sts=2 ts=2 et

    "autocmd python nnoremap <silent><A-/> <S-i>#<ESC>:w<CR>
    "autocmd rust nnoremap <silent><A-/> <S-i>//<ESC>:w<CR>
    "autocmd go nnoremap <silent><A-/> <S-i>//<ESC>:w<CR>

augroup END
"endif

