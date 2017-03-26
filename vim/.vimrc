" Set options before loading plugins

" =============================================================================
" You complete me options
"
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_global_ycm_extra_conf = '~/code/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_show_diagnostic_ui = 0

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
" All plugin loading should go inbetween the begin and end
" All plugins go here
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'

" Themes
Plugin 'vim-scripts/darkspectrum'

" No more plugins after this
call vundle#end()
filetype plugin indent on

" Turn off the red highlighting in YCM
highlight YcmErrorLine guibg=#000000 

" =============================================================================
" Key remaps
" =============================================================================

let mapleader="\<Space>" " Remap the leader key to space

" Switch between the last two files:
nnoremap <leader><leader> <c-^>

" Recopy what's pasted
xnoremap p pgvy

" Bind keys I often accidentally hit shift on
command W w
command Wq wq
command Q q
command WQ wq

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

set ruler	        " Show cursor
set incsearch       " Do incremental search
set history=100     " Save more than 8 commands
set showcmd         " Show incomplete commands down at the bottom
set colorcolumn=81  " One off as it's the limit, not the barrier

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

set list listchars=tab:\ \ ,trail:.	" Display tabs and trailing spaces visually

" Start scrolling when we're getting close to ends of screens
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" GVim options to remove all tool bars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
