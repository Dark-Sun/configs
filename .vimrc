call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'

call plug#end()

syntax on
filetype plugin on
colorscheme onehalfdark

" === Settings ===
" Set color for NERDTree folders
hi Directory guifg=#DCDFE4 ctermfg=252
set encoding=UTF-8
set number
set t_Co=256
set guifont=FiraCode\ Nerd\ Font:h18
set guioptions= "Remove scrollbars is gui mode"
set backspace=indent,eol,start "Fix backspace
set nowrap
set incsearch
set scrolloff=8
set tabstop=2 
set signcolumn=yes
"set hidden
set noerrorbells
set colorcolumn=80
set updatetime=100
set scrolloff=8

"Fix delay for changing cursor in insert mode
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" === Let definitions ===
"Fix colorcheme folors
"Disable for macOS default terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"NERDTree
let NERDTreeMinimalUI=1

" Airline
let g:airline_theme='onehalfdark'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1

" Change cursor to line in Insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"Configure Ale linters
let g:ale_linters_explicit = 1 
let g:ale_linters = { 'ruby': ['rubocop'], 'haml': ['hamllint'], 'scss': ['scsslint'] }

" === Autocommands ===
"" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd InsertEnter,InsertLeave * set cul! "Line cursor in insert mode"

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" === Shortcuts ===

" nnoremap <C->< :tabprevious<CR>
" nnoremap <C->> :tabnext<CR>

" Switch windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" NERD Tree Configuration 
" Setup NERD Tree Shortcuts
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fuzzy Search - fzf
nnoremap <C-p> :Files<CR>


