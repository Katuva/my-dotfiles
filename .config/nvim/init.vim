set undofile
set encoding=utf-8

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

set ignorecase
set number relativenumber
set conceallevel=1
set termguicolors

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
"
" autocmd FileType yaml setlocal softtabstop=2 shiftwidth=2 tabstop=2

set cursorline
set cursorcolumn

set history=1000

filetype plugin indent on

set undodir=~/.config/nvim/undodir

set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-scripts/Vimball'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/nginx.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/SimpylFold'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/nginx.vim'
Plug 'Shougo/vimproc.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
Plug 'ncm2/ncm2-ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'tpope/vim-sleuth'
" Plug 'thaerkh/vim-indentguides'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'

call plug#end()

set background=dark
colorscheme palenight

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:ultisnips_php_scalar_types = 1

augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END

" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_set_quickfix = 0
let g:ale_list_window_size = 5
let g:ale_php_phpcbf_standard = 'PSR2'
let g:ale_php_phpcs_standard = 'phpcs.xml.dist'
let g:ale_php_phpmd_ruleset = 'phpmd.xml'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
  \}
let g:ale_fix_on_save = 1

" context-aware menu with all functions (ALT-m)
nnoremap <m-m> :call phpactor#ContextMenu()<cr>

nnoremap gd :call phpactor#GotoDefinition()<CR>
nnoremap gr :call phpactor#FindReferences()<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" extract variable
vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" extract interface
nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>

let g:phpactor_executable = '~/.vim/plugged/phpactor/bin/phpactor'

let g:fzf_mru_relative = 1
nnoremap <leader><Enter> :FZFMru<cr>
" to enable found references displayed in fzf
let g:LanguageClient_selectionUI = 'fzf'

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

au FileType php let b:delimitMate_matchpairs = "(:),[:],{:}"

" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1
" set ts=4 sw=4 et
" let g:indent_guides_color_change_percent = 30
