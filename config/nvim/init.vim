let g:polyglot_disabled = ['autoindent']
" https://github.com/macvim-dev/macvim/wiki/FAQ#how-to-use-pythonrubylua-interface-in-macvim
if !has('nvim')
  set pythonthreedll=/usr/local/Frameworks/Python.framework/python
endif
" let g:snipMate = { 'snippet_version' : 1 }
"================================================================================
" package manager
"================================================================================
if &compatible
  set nocompatible               " Be improved
endif

set runtimepath+=/usr/local/opt/fzf
" test

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

if exists('g:vscode')
  Plug 'easymotion/vim-easymotion'
  " edit quoted string
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  " toggle comment out/in
  Plug 'tpope/vim-commentary'
  " Auto close parentheses and repeat by dot dot dot...
  Plug 'cohama/lexima.vim'
  " A solid language pack for Vim.
  Plug 'sheerun/vim-polyglot'

  " support jsx
  " Plug 'mxw/vim-jsx'

else
  " snippet support
  " Plug 'MarcWeber/vim-addon-mw-utils'
  " Plug 'tomtom/tlib_vim'
  " Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'

  " ColorSchemes
  Plug 'vim-scripts/Wombat'
  Plug 'altercation/solarized'
  Plug 'tomasr/molokai'
  Plug 'vim-scripts/Railscasts-Theme-Guiand256color'
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-solarized8'
  Plug 'mhartington/oceanic-next' " OceanicNext
  Plug 'adrian5/oceanic-next-vim' " oceanicnext
  Plug 'sainnhe/everforest'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'ayu-theme/ayu-vim'
  if has('nvim')
    Plug 'rebelot/kanagawa.nvim'
  endif
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'whatyouhide/vim-gotham'
  Plug 'rose-pine/vim'
  Plug 'xero/miasma.nvim'
  Plug 'sainnhe/gruvbox-material'

  " quickly run code
  Plug 'thinca/vim-quickrun'
  " lightware powerline-like statusbar
  Plug 'itchyny/lightline.vim'
  " remove trailing space
  Plug 'bronson/vim-trailing-whitespace'
  " visualize indent
  Plug 'Yggdroot/indentLine'
  " easy search and jump
  Plug 'easymotion/vim-easymotion'
  Plug 'elzr/vim-json'
  " edit quoted string
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  " toggle comment out/in
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  " Auto close parentheses and repeat by dot dot dot...
  Plug 'cohama/lexima.vim'
  " A solid language pack for Vim.
  Plug 'sheerun/vim-polyglot'
  " easy coding HTML and CSS
  Plug 'mattn/emmet-vim'
  " editoconfig support
  Plug 'editorconfig/editorconfig-vim'
  " aligning text (visual select + '=')
  Plug 'godlygeek/tabular'
  " tree filer
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Sublime-like multiple section editing
  Plug 'terryma/vim-multiple-cursors'
  " easy selection expand
  Plug 'terryma/vim-expand-region'
"""""""""""  " help in japanese
"""""""""""  Plug 'vim-jp/vimdoc-ja'
  " fileicon
  Plug 'ryanoasis/vim-devicons'
  " fuzzy search
  Plug 'junegunn/fzf.vim'
  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'
  " show git diff sign
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " integrate Direnv
  Plug 'direnv/direnv.vim'

  " support golang
  " Plug 'fatih/vim-go'

  " rainbow parentheses
  Plug 'amdt/vim-niji'

  " support LSP
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/jsonc.vim'

  Plug 'hashivim/vim-vagrant'


  " coc
  " Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
  " Plug 'coc-tsserver'         , {'do': 'yarn install --frozen-lockfile'}
  " Plug 'coc-pyright'          , {'do': 'yarn install --frozen-lockfile'}
  " Plug 'coc-snippets'         , {'do': 'yarn install --frozen-lockfile'}
  " Plug 'coc-toml'             , {'do': 'yarn install --frozen-lockfile'}
  " Plug '@yaegassy/coc-yaml'   , {'do': 'yarn install --frozen-lockfile'}
  " Plug 'coc-json'             , {'do': 'yarn install --frozen-lockfile'}
  " Plug 'coc-css'              , {'do': 'yarn install --frozen-lockfile'}
  " Plug 'coc-html'             , {'do': 'yarn install --frozen-lockfile'}

  " auto paste mode
  Plug 'conradirwin/vim-bracketed-paste'
endif


call plug#end()


"================================================================================
" Options
"================================================================================
syntax on
filetype on
filetype plugin on
filetype indent on
set cmdheight=1
set smartindent
set autoindent
set cindent
set number
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set tabstop=2      " tab size
set shiftwidth=2   " auto indent size
set softtabstop=-1 " Number of spaces that <Tab> inserted / -1: same shiftwidth
set expandtab
set nowrap
set nobackup
set noswapfile
set noundofile
set list
set listchars=extends:»,tab:>\ ,precedes:«,nbsp:%
" set listchars=eol:↲,trail:-,extends:»,tab:>\ ,precedes:«,nbsp:%
set wildmenu
set hlsearch
set laststatus=2
set ignorecase
set smartcase
" set ambiwidth=double
set cursorline
set backspace=indent,eol,start
set noshowmode " lightlineで表示するためモード表示をオフ
set timeoutlen=400
set mouse=a
if has('mouse_sgr')
  set ttymouse=sgr
elseif !has('nvim')
  set ttymouse=xterm2
endif
set helplang=ja,en " helpの優先順位
set fillchars+=vert:│ " vsplit等で使用する罫線
set splitright
set splitbelow
set colorcolumn=   " 80行制限などがあっても縦線をつけない
set fileencodings=utf-8,cp932,sjis,euc-jp,latin1
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
if !has('nvim')
  set termwinsize=15*0
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" クリップボード連携
if system('uname -s') =~ "Darwin"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus,autoselect "Linux
endif
" ================================================================================
"  colorscheme
" ================================================================================
if has('termguicolors')
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
  set background=dark
  augroup TransparentBG
    autocmd!
    autocmd Colorscheme * highlight Normal      ctermbg=NONE guibg=NONE
    autocmd Colorscheme * highlight NonText     ctermbg=NONE guibg=NONE
    autocmd Colorscheme * highlight LineNr      ctermbg=NONE guibg=NONE
    autocmd Colorscheme * highlight Folded      ctermbg=NONE guibg=NONE
    autocmd Colorscheme * highlight EndOfBuffer ctermfg=NONE guifg=bg
    autocmd Colorscheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
    " autocmd Colorscheme * highlight CursorLine  ctermbg=NONE guibg=NONE
    autocmd Colorscheme * highlight Terminal    ctermbg=NONE guibg=NONE
    autocmd Colorscheme * highlight ColorColumn ctermbg=NONE guibg=NONE
  augroup END
  let g:gruvbox_italic = 1
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
  " let ayucolor="mirage"
  let ayucolor="dark"
  " let ayucolor="mirage"
  " silent! colorscheme gruvbox
  " silent! colorscheme OceanicNext
  " silent! colorscheme solarized8
  " silent! colorscheme onehalfdark
  " silent! colorscheme ayu
  " silent! colorscheme gotham256
  " silent! colorscheme rosepine
  " colorscheme railscasts
  " silent! colorscheme wombat
  " colorscheme molokai
  " colorscheme miasma
  " colorscheme gruvbox-material
  colorscheme kanagawa-wave
endif

if has('terminal')
  function! s:set_default_ansi_colors() abort
    if exists('g:terminal_ansi_colors')
      return
    endif

    " let g:terminal_ansi_colors = [
    " \ 'black',     'dark red',     'dark green', 'brown',
    " \ 'dark blue', 'dark magenta', 'dark cyan',  'light grey',
    " \ 'dark grey', 'red',          'green',      'yellow',
    " \ 'blue',      'magenta',      'cyan',       'white'
    " \ ]

    " gruvbox dark
    let g:terminal_ansi_colors = [
      \ "#282828", "#cc231d", "#98971a", "#d79921",
      \ "#458588", "#b16286", "#689d6a", "#a89984",
      \ "#928374", "#fb4934", "#b8bb26", "#fabd2f",
      \ "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"
      \ ]
  endfunction
  call s:set_default_ansi_colors()

  " augroup TerminalConfig
  "   autocmd!
  "   autocmd ColorScheme * call s:set_default_ansi_colors()
  "   autocmd TerminalOpen *
  "         \ if &buftype == 'terminal' && &columns >= 160
  "         \    | wincmd J | else | wincmd J | endif
  "         " \    | wincmd L | else | wincmd J | endif
  " augroup END
endif

"================================================================================
" keymap
"================================================================================
let g:mapleader = "\<Space>"

" ESC連打でハイライト解除
nmap <silent><nowait> <Esc><Esc> :nohlsearch<CR><Esc>
nmap <silent><nowait> <F3>       :nohlsearch<CR><Esc>

" 空行の挿入
" nnoremap <silent><nowait> <Leader><CR> o<Esc>
" nnoremap <silent><nowait> <Leader>o o<Esc>
" nnoremap <silent><nowait> <Leader>O O<Esc>
nnoremap <silent><nowait> <C-o> :<C-u>call append(expand('.'), '')<CR>j
nnoremap <silent><nowait> <C-i> :<C-u>call append(line('.') - 1, '')<CR>k

" nnoremap <D-CR> o<ESC>
" nnoremap <S-D-CR> O<ESC>

" 指定した行番号へジャンプ
nnoremap <CR> G

" NORMALモードへ簡単に戻れるようにする
inoremap <silent><nowait> jj <ESC>
inoremap <silent><nowait> kk <ESC>:w<CR>

" 次の行に空行を挿入し、カーソルを移す
inoremap <silent><nowait> <C-j> <C-o>o

" 正規表現のメタ文字の扱いを制御する
" nnoremap /  /\v

" NERDtreeの切り替え
map <Leader>n :NERDTreeToggle<CR>

" Expand Selection Region
vmap v     <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Tab out quote/bracket
" inoremap <expr> <tab> search('\%#[]>)}''"]', 'n') ? '<Right>' : '<tab>'
" inoremap <silent> <tab> ])
inoremap <C-l> <C-g>U<Right>
" inoremap <Tab> <C-g>U<Right>

" inoremap <silent><nowait> ;; <C-O>$;<CR>
" inoremap <nowait> <D-;> <C-O>$;<CR>
" nmap <esc><esc> <cmd>call coc#float#close_all()<cr>

"================================================================================
" cursor
"================================================================================
if has('vim_starting')
" 参考：mintty の制御シーケンス
" mintty でカーソル形状を変える制御シーケンスは以下のとおり。

" ESC [ 0 SP q ⇒ mintty のデフォルト設定
" ESC [ 1 SP q ⇒ ブロック型、点滅あり
" ESC [ 2 SP q ⇒ ブロック型、点滅なし
" ESC [ 3 SP q ⇒ 下線型、点滅あり
" ESC [ 4 SP q ⇒ 下線型、点滅なし
" ESC [ 5 SP q ⇒ ライン型、点滅あり
" ESC [ 6 SP q ⇒ ライン型、点滅なし

" t_SI : start insert mode (bar cursor shape)
" t_SR : start replace mode (underline cursor shape)
" t_EI : end insert or replace mode (block cursor shape)
" t_ti : put terminal into 'termcap' mode
" t_te : end of 'termcap' mode

  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " vim起動時
  let &t_ti .= "\e[2 q"
  " terminalに戻る時
  let &t_te .= "\e[0 q"
endif

"================================================================================
" indent
"================================================================================
augroup FileTypeIndent
  autocmd!
  autocmd FileType go      setlocal ts=4 sw=0 sts=-1 noexpandtab
  autocmd FileType python  setlocal ts=4 sw=0 sts=-1 expandtab
  autocmd FileType vim     setlocal ts=2 sw=0 sts=-1 expandtab
  autocmd FileType zsh     setlocal ts=2 sw=0 sts=-1 expandtab
  autocmd FileType bash    setlocal ts=2 sw=0 sts=-1 expandtab
  autocmd FileType sh      setlocal ts=2 sw=0 sts=-1 expandtab
augroup END

"================================================================================
" language config
"================================================================================
augroup FileTypeConfig
  autocmd!
  " 処理系はgaucheのみなのでフラグをセット
  autocmd FileType scheme let g:is_gauche = 1
  " autocmd FileType rust   let g:rustfmt_autosave = 1
augroup END

"================================================================================
" FileType config
"================================================================================
augroup FileTypeDetect
  autocmd!
  autocmd BufRead,BufNewFile *.bashrc       set filetype=bash
  autocmd BufRead,BufNewFile .bash_profile  set filetype=bash
  autocmd BufRead,BufNewFile .bash_login    set filetype=bash
  autocmd BufRead,BufNewFile .bash_logout   set filetype=bash
  autocmd BufRead,BufNewFile tsconfig.json  set filetype=jsonc
augroup END

"================================================================================
" help config
"================================================================================
augroup HelpConfig
  autocmd!
  autocmd FileType help
        \ if &columns >= 160 | wincmd L | else | wincmd J | endif
augroup END

augroup ReadOnlyBufferConfig
  autocmd!
  " autocmd FileType help,qf,quickrun let b:mapleader = ","
  autocmd FileType help,qf,quickrun nnoremap <buffer><nowait> <Space> <c-f>
  autocmd FileType help,qf,quickrun nnoremap <buffer><nowait> f       <c-f>
  autocmd FileType help,qf,quickrun nnoremap <buffer><nowait> b       <c-b>
  autocmd FileType help,qf,quickrun nnoremap <buffer><nowait> q       <c-w>c
augroup END

"================================================================================
" grep
"================================================================================
augroup QuickFixConfig
  autocmd!
  autocmd QuickFixCmdPost *grep* copen
  autocmd FileType qf let b:gitgutter_was_enabled = 0
  autocmd FileType qf nnoremap <buffer> <CR>  :.cc<CR>
augroup end
command! -nargs=+ Grep execute 'silent grep! <args>' | copen

"================================================================================
" editoconfig
"================================================================================
" 最大文字数のインジケーターを表示しない
let g:EditorConfig_max_line_indicator = "none"

"================================================================================
" Emmet.vim
"================================================================================
augroup EmmetConfig
  autocmd!
  " タブでEmmet展開
  autocmd FileType html,css,php,javascript.jsx imap <buffer><expr> <TAB>
      \ emmet#isExpandable() ? "\<Plug>(emmet-expand-abbr)" : "\<TAB>"
augroup END
let g:user_emmet_settings = {
\    'variables' : {
\      'lang' : 'ja',
\    },
\    'php' : {
\      'extends': 'html',
\      'filters': 'html,c',
\    },
\ }

"================================================================================
" lightline
"================================================================================
  " \   'colorscheme': 'seoul256',
  " \   'colorscheme': 'srcery_drk',
let g:lightline = {
  \   'colorscheme': 'gotham256',
  \   'active': {
  \     'left': [
  \       [ 'mode', 'paste' ],
  \       [ 'gitbranch', 'readonly', 'relativepath', 'modified' ]
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['coc', 'filetype', 'eolformat', 'fileencoding'],
  \     ],
  \   },
  \   'component': {
  \      'charvaluehex': '0x%04B',
  \      'eolformat': &fileformat ==# 'dos' ? 'CRLF' : 'LF',
  \   },
  \   'component_function': {
  \      'gitbranch': 'fugitive#head',
  \      'coc': 'coc#status',
  \   },
  \ }

"================================================================================
" vim-json
"================================================================================
" jsonのクォート文字を表示させる
let g:vim_json_syntax_conceal = 0

"================================================================================
" IndentLine
"================================================================================
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['text']
let g:indentLine_bufTypeExclude = ['help', 'terminal']

"================================================================================
" NERDTree
"================================================================================
let g:NERDTreeShowHidden = 1
augroup NERDTreeConfig
  autocmd!
  " 最後のバッファを閉じた時にNERDTreeも一緒に閉じる
  autocmd bufenter *
        \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
        \   | q | endif
augroup END

"================================================================================
" gitgutter
"================================================================================
" augroup gitgutterConfig
"   autocmd!
"   autocmd FileType * if fugitive#head() != '' | set signcolumn=yes | endif
" augroup END

"================================================================================
" QuickRun
"================================================================================
augroup QuickRunConfig
  autocmd!
  autocmd FileType quickrun setlocal wrap
augroup END
nnoremap <Leader>r :QuickRun<CR>
let g:quickrun_config = {
  \  "_": {
  \    "outputter/buffer/into": 1,
  \    "outputter/buffer/split": '%{winwidth(0) <= 160 ? "" : "vertical"}'
  \  },
  \}
let g:quickrun_config.rust = { "exec": "cargo run --quiet --color never" }
let g:quickrun_config.python = {'command': 'python3'}

"================================================================================
" Vim-Polyglot
"================================================================================
" let g:polyglot_disabled = ['autoindent']
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0


"================================================================================
" IME
"================================================================================
" ノーマルモードに戻ったときにIMEを無効化する
augroup IMEControl
  autocmd!
  autocmd InsertLeave * call DisableIme()
augroup END

function! DisableIme() abort
  if has('mac')
    call system('/usr/local/bin/im-select com.google.inputmethod.Japanese.Roman')
  endif
endfunction


"================================================================================
" Check plugin installed
"================================================================================
" check the specified plugin is installed
function s:is_plugged(name)
  if exists('g:plugs') &&
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir)
    return 1
  else
    return 0
  endif
endfunction

"================================================================================
" coc.nvim
"================================================================================
if s:is_plugged('coc.nvim')
  let coc_data_home = $XDG_DATA_HOME . '/coc'

  let g:coc_filetype_map = {
    \ 'yaml.ansible': 'ansible',
    \ }

  let g:lexima_no_default_rules = 1
  call lexima#set_default_rules()

  " inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
  " inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
  inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : ""
  inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : ""

  " Use Enter to confirm completion
  inoremap <silent><expr> <CR>
        \ coc#pum#visible() ? coc#pum#confirm() :
        \ <SID>lexima_expand()

  function! s:lexima_expand() abort
    return lexima#expand('<CR>', 'i')
  endfunction

  " Don't use <tab> to confirm completion
  inoremap <silent><expr> <TAB>
        \ <SID>is_closing_char() ? "\<C-g>U<Right>" :
        \ "\<TAB>"

  function! s:is_closing_char() abort
    return getline('.')[col('.')-1] =~ '[>\])}"`'':;.]'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <C-SPACE> coc#refresh()
  inoremap <silent><expr> <C-@> coc#refresh()
  " if has('nvim')
  "   inoremap <silent><expr> <C-SPACE> coc#refresh()
  " else
  "   inoremap <silent><expr> <C-@> coc#refresh()
  " endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif CocAction('hasProvider', 'hover')
      call CocAction('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  " nmap <leader>rn <Plug>(coc-rename)
  nmap <F2> <Plug>(coc-rename)

  " Formatting selected code.
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)


  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold   :call CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OrganizeImport :call CocAction('runCommand', 'editor.action.organizeImport')


  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  "========================
  " coc-snippets
  "========================
  " Use <C-l> for trigger snippet expand.
  " imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  " vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  " let g:coc_snippet_next = '<C-n>'
  let g:coc_snippet_next = '<Tab>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<S-Tab>'
  " let g:coc_snippet_prev = '<C-p>'

  " Use <C-l> for trigger snippet expand.
  imap <C-k> <Plug>(coc-snippets-expand)

endif


