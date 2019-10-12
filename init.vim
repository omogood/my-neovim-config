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

" netrw の設置絵
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_winsize=25
let g:netrw_chgwin=2

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

" terminal emulator を zsh に設定
set sh=zsh

" ビープ音とビジュアルベルを無効にする
set noerrorbells
set novisualbell
set vb t_vb=

" terminal emulator でノーマルモードに移行するキーマップ
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-j><C-j> <C-\><C-n>

" keymap の再設定
let mapleader = "\<Space>"

" pyenv でPython3 を入れてるからこの設定を行う。
let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
"let g:python_host_prog = $PYENV_ROOT . '/versions/2.7.10/bin/python'
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
"inoremap <silent><C-j><C-j> <esc>:w<CR>

" ハイライトの非表示
nnoremap <silent><ESC><ESC> :noh<CR>

" タブ移動
nnoremap <A-]> gt
nnoremap <A-[> gT

" ウィンドウのサイズを変更する
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>

" ウィンドウを上にスクロール
nnoremap <C-k> <C-y>
" ウィンドウを下にスクロール
nnoremap <C-j> <C-e>
" ウィンドウを左にスクロール
nnoremap <C-h> zh
" ウィンドウを右にスクロール
nnoremap <C-l> zl


" 対応する括弧への移動 Control+Enter
" <C-v><C-CR> で
" 文字を表示
"nnoremap 
 %
"vnoremap 
 %

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
" yank
nnoremap <C-y> viwy
" paste
nnoremap <C-p> viw"0p
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

set t_Co=256

" TrueColor 対応
set termguicolors


if &compatible
	set nocompatible
endif

" ------------------------------------------------------------------------------
" coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" ------------------------------------------------------------------------------


" --- vim-plug を使ったパッケージ管理
call plug#begin('~/.config/nvim/plugged')

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" AEL
Plug 'w0rp/ale'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'JakeBecker/elixir-ls'

" Python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" vim-airline ステータスバーなどの見た目系
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ctags
Plug 'universal-ctags/ctags'

" TOML Syntax
Plug 'cespare/vim-toml'

" Color Scheme
Plug 'cocopon/iceberg.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" Emmet
Plug 'mattn/emmet-vim'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vue.js
Plug 'posva/vim-vue'
call plug#end()

" ----------------------------------------------------------------------
" Elixir
let g:ale_linters = {
\ 'elixir': ['elixir-ls'],
\}

let g:ale_fixers = {
\ 'elixir': ['mix_format'],
\}

let g:ale_elixir_elixir_ls_release = '~/.config/elixir-tools/elixir-ls/release'

let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
noremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>af :ALEFix<cr>
noremap <Leader>ar :ALEFindReferences<CR>
"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" ----------------------------------------------------------------------

" Color Scheme の設定
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

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
let g:airline_theme='gruvbox'

filetype plugin indent on

" ctags
set tags=./tags,tags;
nnoremap <silent><C-]> g<C-]>


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

" ------------------------------------------------------------------------------
" fzf
nnoremap <silent><leader>; :Files<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>t :Tags<CR>


