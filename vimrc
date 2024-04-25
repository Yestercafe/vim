"" -----
"" Basic
"" -----
set nocompatible
set nobackup
set noswapfile
let mapleader=" "
inoremap kj <ESC>

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

syntax on

" Encoding
set encoding=utf-8
set fileencodings=utf-8,gb18030

set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set title
set scrolloff=5
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir

" Powerful backspace?
set backspace=indent,eol,start

" Last open position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" (t)oggle showing (i)nvisible characters
set nolist
set listchars=extends:#,precedes:#,tab:▸\ ,trail:▫,eol:¬
nmap <leader>ti :set list!<CR>

" Disable bell
set visualbell
set noerrorbells
set t_vb=

" Fix mouse scrolling 
" ref: https://www.reddit.com/r/vim/comments/c7a39a/can_anyone_tell_me_what_this_is/
let &t_ut=''

" w!! saves the file with sudo
cmap w!! w !sudo tee % >/dev/null


"" ---
"" Indent
"" ---
function! SetTab2()
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    echo "Tab width set to 2"
endfunction
function! SetTab4()
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    echo "Tab width set to 4"
endfunction
function! ToggleTabWidth()
    if &tabstop == 2
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        echo "Tab width set to 4"
    else
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        echo "Tab width set to 2"
    endif
endfunction
" (t)oggle (t)ab
nnoremap <leader>tt :call ToggleTabWidth()<CR>
map <leader>tT2 :call SetTab2()<CR>
map <leader>tT4 :call SetTab4()<CR>

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"nnoremap < <<
"nnoremap > >>
vnoremap < <gv
vnoremap > >gv


"" -------
"" Motions
"" -------
set mouse=a

noremap H ^
noremap L $
noremap U <C-u>
noremap D <C-d>

" Disable arrow keys
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>

" Use different cursor shape in different mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"" ---------------
"" Basic shortcuts
"" ---------------
" %% expands into path to current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" (f)ile (f)ile
map <leader>ff :e %%
" (f)ile (s)ave
map <leader>fs :w<CR>
" (q)uit (q)uit
map <leader>qq :q<CR>
map <leader>qQ :qall<CR>
" (f)ile (S)ource vimrc
map <leader>fS :source $MYVIMRC<CR>
" (q)(w)
map <leader>qw :wq<CR>
" force quit
map <leader>q! :q!<CR>

" The optional schema (deprecated)
"map <leader>w :w<CR>
"map <leader>q :q<CR>
map <leader><f4> :source $MYVIMRC<CR>


"" ------
"" Editor
"" ------
noremap s <nop>
" Use meta-backspace to delete a word in terminal
inoremap <Esc><BS> <C-W>


"" ------------------
"" Search & highlight
"" ------------------
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap n nzz
noremap N Nzz
" (s)earch lighting (c)lear
noremap <LEADER>sc :nohlsearch<CR>

" (t)oggle highlight co(l)umn81
let &colorcolumn=0
nnoremap <leader>tl :call ColorColumnToggle()<CR>
function! ColorColumnToggle()
    if &colorcolumn
        set colorcolumn=0
    else
        set colorcolumn=81
    endif
endfunction


"" -------------
"" Window manage
"" -------------
" Window split: (v)ertical & (s)plit
map <leader>wv :set splitright<CR>:vsplit<CR>
map <leader>wV :set nosplitright<CR>:vsplit<CR>
map <leader>ws :set splitbelow<CR>:split<CR>
map <leader>wS :set nosplitbelow<CR>:split<CR>
map <leader>w2 :set splitright<CR>:vsplit<CR>
map <leader>w3 :set splitbelow<CR>:split<CR>

" Window focus
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>wh <C-w>h
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l
" The optional schema
noremap <Up> <C-w>k
noremap <Down> <C-w>j
noremap <Left> <C-w>h
noremap <Right> <C-w>l

" Window size
noremap <leader>w+ :res +2<CR>
noremap <leader>w= :res +2<CR>
noremap <leader>w- :res -2<CR>
noremap <leader>w< :vertical resize-4<CR>
noremap <leader>w> :vertical resize+4<CR>
" The optional schema
noremap <S-Up> :res -2<CR>
noremap <S-down> :res +2<CR>
noremap <S-left> :vertical resize-4<CR>
noremap <S-right> :vertical resize+4<CR>

" Buffers
nmap <leader>bh :bp<CR>
nmap <leader>bl :bn<CR>
nmap <leader>bH :bf<CR>
nmap <leader>bL :bl<CR>
nmap <leader>bb :b 
nmap <leader>B :buffers<CR>
" (b)uffer (k)ill
nmap <leader>bk :bw
" (b)uffer (r)ewind
nmap <leader>br :brewind<CR>

" Tabs(j)
" (j) (n)ew
map <leader>jn :tabe<CR>
" (j) (f)ile
map <leader>jf :tabe %%
map <leader>jl :+tabnext<CR>
map <leader>jh :-tabnext<CR>


"" -------
"" Plugins
"" -------

call plug#begin('~/.vim/plugged')

"" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" themes
Plug 'connorholyday/vim-snazzy'

"" nerd tree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

"" easy motion
Plug 'easymotion/vim-easymotion'

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
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

"" Bookmarks
Plug 'kshenoy/vim-signature'

"" Utils
Plug 'preservim/nerdcommenter'

"" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Wakatime
Plug 'wakatime/vim-wakatime'

"" auto-pairs
Plug 'Yescafe/auto-pairs'

"Plug 'rescript-lang/vim-rescript'
"Plug 'msuperdock/vim-agda'

call plug#end()


"" Theme
"color snazzy

"" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='molokai'
let g:airline_section_z = "%p%% %l/%L:%v"

"" nerd tree
map <leader>fd :NERDTreeToggle<CR>
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
    \ "Unknow"   : "?"
    \ }


"" easy motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" (s)earch
nmap s <Plug>(easymotion-f)
" (m)otion (f)ind2
nmap mf <Plug>(easymotion-f2)
" (m)otion (l)ine
nmap ml <Plug>(easymotion-jk)
" (m)otion (w)ord
nmap mw <Plug>(easymotion-w)


"" tag bar
" ui/tag
map <silent>ut :TagbarOpenAutoClose<CR>


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
" ui/(m)arkdown table mode
map <leader>um :TableModeToggle<CR>


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
map <leader>uu :UndotreeToggle<CR>:UndotreeFocus<CR>


"" Coc.vim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>cd :call ShowDocumentation()<CR>


"" Nerd commenter
nnoremap gcc <leader>c<leader>
vnoremap gc <leader>c<leader>


"" auto pairs

let g:AutoPairsMapSpace = 0

