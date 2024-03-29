""" GENERAL SETTINGS
set nocompatible
set number
set ruler
syntax enable           " enable syntax processing
syntax on
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4    
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set smarttab
set ai                  " auto indent
set si                  " smart indent
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set ttyfast
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " case insensitive search
set smartcase
set scrolloff=1         " be able to see where we are scrolling
set sidescrolloff=5
set autoread            " read if file is changed

""" MATCHING PARENTHESISES
" let g:loaded_matchparen=1

""" TURN OFF SEARCH HIGHLIGHT
nnoremap <leader><space> :nohlsearch<CR>

""" FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

""" SPACE OPEN/CLOSES FOLDS
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

""" REOPEN FILE TO SAME SPOT
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""" CLOSE NERD TREE WHEN CLOSING VIM
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

""" CURSOR
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"

""" CMD LINE STUFF
set laststatus=0
set cmdheight=1

""" COLUMN WARNING
" set colorcolumn=80

""" SYSTEM CLIPBOARD
set clipboard=unnamed,unnamedplus

""" REPLACE CURRENTLY SELECTED TEXT WITH DEFAULT REGISTER WITHOUT YANKING IT
vnoremap p "_dP

""" LINE WRAPPING TOGGLING FOR LARGE DATA FILES
:function ToggleWrap()
: if (&wrap == 1)
:   set nowrap
:   set scrollopt=hor
:   6split
:   windo set scrollbind
: else
:   set wrap
: endif
:endfunction

nnoremap <leader><C-w> :call ToggleWrap()<CR>

""" WINDOW NAVIGATION
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j
nnoremap <C-Right> <C-w>l
nnoremap <C-Left> <C-w>h

""" PLUGINS
call plug#begin('~/.config/nvim/plugs')
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ludovicchabant/vim-gutentags'
Plug 'AndrewRadev/switch.vim'
Plug 'gerazov/vim-toggle-bool'
call plug#end()

""" UNUSED
""" Fix markdown and tex
" Plug 'github/copilot.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'Yggdroot/indentLine'
" Plug 'wfxr/minimap.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'dense-analysis/ale'
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
" Plug 'tmsvg/pear-tree'
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'
" Plug 'svermeulen/vim-easyclip'
" Plug 'morhetz/gruvbox'
" Plug 'psliwka/vim-smoothie'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'sirver/ultisnips'
" Plug 'OriolAbril/MESAstro-vim'
" Plug 'severin-lemaignan/vim-minimap'
""" PATHFINDER
" if has('python3') && has('timers')
"   Plug 'danth/pathfinder.vim'
" else
"   echoerr 'pathfinder.vim is not supported on this Vim installation'
" endif

""" TAGS
set statusline+=%{gutentags#statusline()}

""" TAB COMPLETION
""" ackyshake/VimCompletesMe, install with:
""" git clone git://github.com/ajh17/VimCompletesMe.git ~/.vim/pack/vendor/start/VimCompletesMe
set completeopt=menu
autocmd FileType vim let b:vcm_tab_complete = 'vim'

""" VIM TEX SETTINGS
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_matchparen_enabled=0
let g:vimtex_compiler_progname = 'nvr'
set conceallevel=2
let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_mode=0
set encoding=utf-8

""" TEX CONCEAL
" set conceallevel=2
" let g:tex_conceal="abdgms"

""" EASY CLIP SETTINGS
" let g:EasyClipShareYanks=1
" nnoremap gm m

""" GITGUTTER
" autocmd VimEnter * GitGutterEnable

""" BOOL TOGGLE
nnoremap <silent> <Leader>t :ToggleBool<CR>

""" UTILSNIPS
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""" COLORS
colorscheme wal
" set termguicolors
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='medium'
" set background=dark
" autocmd vimenter * ++nested colorscheme gruvbox

""" MAKE COMMENTS ITALIC
""" kinda hacky but the only way I could make this work
" highlight Comment cterm=italic gui=italic
augroup itcom
  autocmd BufNewFile,BufRead *   highlight Comment cterm=italic gui=italic
augroup END

""" SPELLCHECK
set spelllang=en
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

""" TOGGLE SPELLCHECKING
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>

""" MESA SYNTAX
" filetype indent plugin on

" augroup inlist
"   au!
"   autocmd BufNewFile,BufRead inlist*   set syntax=fortran
"   autocmd BufNewFile,BufRead inlist*   setlocal commentstring=!\ %s
" augroup END

" augroup histprof
"   au!
"   autocmd BufNewFile,BufRead *.list   set syntax=fortran
"   autocmd BufNewFile,BufRead *.list   setlocal commentstring=!\ %s
" augroup END

""" FORTRAN TABS
autocmd FileType fortran setlocal shiftwidth=3 softtabstop=3 expandtab ignorecase

""" FORTRAN SYNTAX
let fortran_free_source=1 "use free form
let fortran_have_tabs=1
let fortran_fold_conditionals=1
let fortran_fold=1
let fortran_fold_multilinecomments=1
" let fortran_more_precise=1

""" highlight line number
" highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" set cursorline
