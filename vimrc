"" -----
"" Basic
"" -----
set nocompatible
let mapleader=" "

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

syntax on

set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
function! SetTab2()
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction
function! SetTab4()
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
endfunction
map <leader>s2 :call SetTab2()<CR>
map <leader>s4 :call SetTab4()<CR>

" set mouse=a
set encoding=utf-8
set fileencodings=utf-8,gb18030
let &t_ut=''
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"" -------
"" Motions
"" -------

imap kj <ESC>

noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l


"" ---------
"" Shortcuts
"" ---------
map s <Nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :


"" ------
"" Search
"" ------
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>


"" -------------
"" Window manage
"" -------------
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <LEADER><up> :res -2<CR>
map <LEADER><down> :res +2<CR>
map <LEADER><left> :vertical resize-4<CR>
map <LEADER><right> :vertical resize+4<CR>

map tt :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>


"" -------
"" Plugins
"" -------

call plug#begin('~/.vim/plugged')

"" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

"" themes
Plug 'connorholyday/vim-snazzy'

"" nerd tree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

"" tag
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

"" undo tree
Plug 'mbbill/undotree'

"" git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

"" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

"" Bookmarks
Plug 'kshenoy/vim-signature'

"" Utils
Plug 'preservim/nerdcommenter' " in <space>cc to comment a line

"" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"" Theme

color snazzy


"" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='wombat'
let g:airline_section_z = "%p%% %l/%L:%v"

"" nerd tree
map <LEADER>t :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


"" nerd tree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


"" tag bar
map <silent> T :TagbarOpenAutoClose<CR>


"" Markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


"" markdown table mode
map <LEADER>mtm :TableModeToggle<CR>


"" vim signiture
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


"" undo tree
let g:undotree_DiffAutoOpen = 0
map <LEADER>ut :UndotreeToggle<CR>

"" Coc.vim
" tab trigger
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

