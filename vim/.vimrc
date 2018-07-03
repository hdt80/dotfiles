" Set options before loading plugins

" ==============================================================================
" Theme options
"
let g:molokai_original = 1

" =============================================================================
" Plugin loading
" =============================================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" At this point plugins can be loaded, now that #begin() has been called. Once
" #end() is called no more plugins can be loaded. Options for each plugin are
" below each line

" Plugin manager used
Plugin 'VundleVim/Vundle.vim'

" Adds text objects for surrounding words
Plugin 'tpope/vim-surround'

" Better cpp syntax
Plugin 'octol/vim-cpp-enhanced-highlight'

" Adds aditional text objects
Plugin 'wellle/targets.vim'

" Syntax highlighting for GLSL
Plugin 'tikhomirov/vim-glsl'

"
Plugin 'rhysd/clever-f.vim'
let g:clever_f_across_no_line	= 1
let g:clever_f_timeout_ms		= 3000

"
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" Themes
Plugin 'vim-scripts/darkspectrum'

" No more plugins after this
call vundle#end()

filetype plugin indent on

" =============================================================================
" Key remaps
" =============================================================================

let mapleader="\<Space>" " Remap the leader key to space

" Switch between the last two files:
nnoremap <leader><leader> <c-^>

" Toggle fold
nnoremap <leader>a za

" Recopy what's pasted
xnoremap p pgvy

" Bind keys I often accidentally hit shift on
command! W w
command! Wq wq
command! Q q
command! WQ wq

" ============================================================================== 
" Tab management
" ============================================================================== 

" Space D to open a new tab and explore with newtr
nnoremap <leader>d :Te<cr>

noremap gc :tabclose<cr>

set showtabline=2 " Always show the tabline

" =============================================================================
" Window management
" =============================================================================

function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr()) " If we haven't moved
		if (match(a:key,'[jk]')) " We're going up or down
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

" Move in that dir, but if that window doesn't exist open it
map <leader>h :call WinMove('h')<cr>
map <leader>k :call WinMove('k')<cr>
map <leader>l :call WinMove('l')<cr>
map <leader>j :call WinMove('j')<cr>

" Close window
map <leader>wc :wincmd q<cr>

" Window rotate
map <leader>wr <C-W>r

" Move a window
map <leader>H :wincmd H<cr>
map <leader>J :wincmd J<cr>
map <leader>K :wincmd K<cr>
map <leader>L :wincmd L<cr>

" =============================================================================
" Settings
" =============================================================================

" Display settings
set ruler	        " Show cursor
set incsearch       " Do incremental search
set history=100     " Save more than 8 commands
set showcmd         " Show incomplete commands down at the bottom
set colorcolumn=81  " One off as it's the limit, not the barrier

set number relativenumber	" Show line numbers, but relative on current line

" Disable backup files
set noswapfile
set nobackup
set nowritebackup

" Enable syntax
syntax on
syntax enable
set t_Co=256	" Use 256 colors for syntax highlighting

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set cino=N-s			" Disable cpp namespace indentation

set list listchars=tab:\ \ ,trail:.	" Display tabs and trailing spaces visually

" Change folded background color to be light grey
hi Folded ctermbg=DarkGray ctermfg=LightBlue
hi LineNr ctermfg=DarkGray

" Start scrolling when getting close to the edge of the screen
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" GVim options to remove all tool bars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
