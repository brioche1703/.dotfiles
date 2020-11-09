" CONFIGURATION / KEVIN "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pluging 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" GENERAL "
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify' 				"open last used buffer
Plug 'vim-airline/vim-airline'			" Airline status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'

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
Plug 'dracula/vim',{'as':'dracula'}
Plug 'octol/vim-cpp-enhanced-highlight'

" Unity "
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'

" Snippets "
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Debugger"
Plug 'puremourning/vimspector'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set cursorline
set hidden
set cmdheight=2
set cmdheight=2
set encoding=utf-8
set autoindent
set nospell
set number relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=10
set expandtab
set wildmode=longest,list,full
set updatetime=300
set ignorecase
set hlsearch
set colorcolumn=81
set textwidth=80
set mouse=a
set noshowmode
set clipboard^=unnamed
set fillchars=vert:\ ,stl:\ ,stlnc:\
highlight ColorColumn ctermbg=235 guibg=#2c2d27

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
colorscheme koehler
set termguicolors
" Make vim background transparent
" hi Normal guibg=NONE ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC key to "kj"
imap kj <Esc>
" Remap leader key
let mapleader = "\<Space>"

" CTRL-C for comment
map <C-c> gcc

" Replace word without deleting buffer
map <C-p> cw<C-r>0<ESC>

" Open .vimrc file
nmap <leader>ov :e ~/.vimrc<CR>
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
let $FZF_DEFAULT_OPTS='--reverse'

let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Airline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

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

nnoremap c<C-h> :lefta vsp new<CR>
nnoremap c<C-j> :bel sp new<CR>
nnoremap c<C-k> :abo sp new<CR>
nnoremap c<C-l> :rightb vsp new<CR>

map <Leader><Tab> :bn<cr>
map <Leader><S-Tab> :bp<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap f <Plug>(easymotion-overwin-f2)
map <leader>/ <Plug>(easymotion-bd-w)
nmap <leader>/ <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify

""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_change_to_dir=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden

set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Press Tab and Shift+Tab and navigate around completion selections
function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

" Snippets go next, prev
let g:coc_snippet_next = '<C-l>' 
let g:coc_snippet_prev = '<M-l>' 

" Press Enter to select completion items or expand snippets
inoremap <silent><expr> <CR>
  \ pumvisible() ? "\<C-y>" :
  \ "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" tnoremap <silent><nowait> <space>t  :<C-u>CocCommand terminal.hidden<CR>

" nnoremap   <silent>   <leader><leader>t    :FloatermNew<CR>
tnoremap   <silent>   <C-t>    <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   <C-h>    <C-\><C-n>:FloatermPrev<CR>
tnoremap   <silent>   <C-l>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Makefile

""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader><F5> :w <CR> :!make && ./runner <CR>

let g:clang_complete_macros = 1
let g:clang_user_options = ' -DCLANG_COMPLETE_ONLY'

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unity

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniSharp """""""""
" Use the stdio version of OmniSharp-roslyn - this is the default
let g:OmniSharp_server_use_mono = 1

let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [1],
\ 'border': [1]
\}

let g:OmniSharp_want_snippet=1

" ALE """""""""""""""
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'cpp': ['clangd']
\}

let g:OmniSharp_selector_ui = 'coc'


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Debugger (vimspector)

""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" Binds
" F5                start/continue debugging
" Shift F5          stop debugging
" Ctrl+Shift F5     restart debugging
" F6                Pause
" F9                Toggle breakpoint on current line
" Shift F9          Add a function breakpoint for the expression under the cursor
" F10               Step over
" F11               Step into
" Shift F11         Step out of the current scope


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SilverSearcher (search in multiple files)

""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'

map <M-f> <Esc><Esc>:ag .<CR>
