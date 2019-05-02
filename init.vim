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
set guifont=hack:h18

" 改行時などに、自動でインデントを設定してくれる
set smartindent

" 0で始まる数値を、8進数として扱わないようにする
"set nrformats-=octal

" ファイル名の補完の可視化
set wildmenu

" ファイル名を常に表示
set laststatus=2

" クリップボードの共有
set clipboard=unnamedplus

" バックアップファイルを作成しない
set nobackup

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
let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python'

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

nnoremap <A-l> :lvim /\<<C-r><C-w>\>/j % \|lw

" 外部 grep の設定
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
" grep 後にクイックフィックスリストが表示される
nnoremap <expr> <leader>g ':grep! ' . expand('<cword>') . ' *'
nnoremap <leader>G :grep! <C-r>* *

nnoremap <silent><leader>f /\V\<<C-r>*\><CR>
nnoremap <silent><leader>F /\V<C-r>*<CR>

" 単語選択
nnoremap <silent><leader><leader> viw
" Insert モード中にペースト
inoremap <C-v> <C-r>"
" Ex モード中にペースト
vnoremap <C-v> <C-r>"
" Terminal モード中にペースト
tnoremap <C-v> <C-r>"

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


if &compatible
	set nocompatible
endif

" ****************************************
"     vim-plug を使ったパッケージ管理
" ****************************************
call plug#begin('~/.config/nvim/plugged')

" vim-lsp 関連
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
" vim-lsp で自動補完を有効にするため
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" fzf
Plug '/home/linuxbrew/.linuxbrew/opt/fzf'
Plug 'junegunn/fzf.vim'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" elm 言語
Plug 'elmcast/elm-vim'

" ALE
Plug 'w0rp/ale'
" ALE - Elixir
let g:ale_elixir_elixir_ls_release = '$HOME/elixir-ls/rel'
let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\}

let g:ale_fixers = {
\   'elixir': ['mix_format'],
\}

let g:ale_sign_column_always = 1

" vim-airline ステータスバーなどの見た目系
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ctags
Plug 'universal-ctags/ctags'

" TOML Syntax
Plug 'cespare/vim-toml'

" Color Scheme
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'

" Emmet
Plug 'mattn/emmet-vim'
call plug#end()


" ****************************************
"             vim-lsp の設定
" ****************************************
let g:lsp_async_completion = 1
" AEL を使用するので、lint 機能は disable とする
let g:lsp_diagnostics_enabled = 0
" debug
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" lsp Python の設定
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" 関数定義・宣言への移動
nnoremap <leader>d :LspDefinition<CR>
nnoremap <leader><C-d> :LspDeclaration<CR>


" ****************************************
"             fzf の設定
" ****************************************
" 新規ウィンドウ
let g:fzf_layout = { 'window': 'enew' }
" 新規タブ
let g:fzf_layout = { 'window': '-tabnew' }
" Files 実行コマンド
nnoremap <C-p> :Files<CR>


" ****************************************
"          vim-airline の設定
" ****************************************
" vim-airline のオプション
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" vim-airline のテーマを設定
let g:airline_theme='iceberg'

" ****************************************
"           Color Scheme の設定
" ****************************************
colorscheme iceberg
set background=dark

filetype plugin indent on

" ****************************************
"           golang の設定
" ****************************************
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1


" ****************************************
"           ctags
" ****************************************
set tags=./tags,tags;


" ****************************************
"           ファイル別の設定
"           以下用語
"               sw=softtabstop
"               sts=shiftwidth
"               ts=tabstop
"               et=expandtab
" ****************************************
"if has("autocmd")
augroup Init
    autocmd!
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css setlocal sw=2 sts=2 ts=2 et
    autocmd FileType elixir setlocal sw=2 sts=2 ts=2 et
    autocmd FileType haskell setlocal sw=2 sts=2 ts=2 et
augroup END
"endif

