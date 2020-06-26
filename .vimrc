"" CONFIGURATION / KEVIN "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pluging 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" GENERAL "
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify' 				"open last used buffer
Plug 'vim-airline/vim-airline'			" Airline status bar
Plug 'vim-airline/vim-airline-themes'

" FOCUS "
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" NerdTree "
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" T-Popo "
Plug 'tpope/vim-commentary'

" Easy Motion "
Plug 'easymotion/vim-easymotion'

" Completion "
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme "
Plug 'artanikin/vim-synthwave84'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set encoding=utf-8
set autoindent
set nospell
set number relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wildmode=longest,list,full
filetype plugin on
syntax on

" Disable auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Navigate with guides
inoremap <leader><leader> <Esc>/<++><CR>"_c4l
vnoremap <leader><leader> <Esc>/<++><CR>"_c4l
map <leader><leader> <Esc>/<++><CR>"_c4l

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif
"set background=dark
"set t_Co=256
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

colorscheme synthwave84

" Make vim background transparent
hi Normal guibg=NONE ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC key to "kj"
imap kj <Esc>
" Remap leader key
let mapleader = "\<Space>"

" CTRL-C for comment
map <C-c> gcc

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Files , backups, and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 "show status line all the time

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Airline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LimeLight
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Split Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap f <Plug>(easymotion-overwin-f2)
map <leader>/ <Plug>(easymotion-bd-w)
nmap <leader>/ <Plug>(easymotion-overwin-w)


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

