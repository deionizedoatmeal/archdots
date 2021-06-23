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


""" PLUGINS
call plug#begin('~/.config/nvim/plugs')
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'

""" Fix markdown and tex
Plug 'sheerun/vim-polyglot'

" Plug 'dense-analysis/ale'

" Plug 'tmsvg/pear-tree'
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'
" Plug 'svermeulen/vim-easyclip'
" Plug 'morhetz/gruvbox'
" Plug 'psliwka/vim-smoothie'

""" UNUSED
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'sirver/ultisnips'
" Plug 'OriolAbril/MESAstro-vim'
" Plug 'severin-lemaignan/vim-minimap'
call plug#end()

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
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_matchparen_enabled=0
let g:vimtex_compiler_progname = 'nvr'

""" EASY CLIP SETTINGS
" let g:EasyClipShareYanks=1
" nnoremap gm m

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
filetype indent plugin on

augroup inlist
  au!
  autocmd BufNewFile,BufRead inlist*   set syntax=fortran
  autocmd BufNewFile,BufRead inlist*   setlocal commentstring=!\ %s
augroup END

augroup histprof
  au!
  autocmd BufNewFile,BufRead *.list   set syntax=fortran
  autocmd BufNewFile,BufRead *.list   setlocal commentstring=!\ %s
augroup END

""" FORTRAN TABS
autocmd FileType fortran setlocal shiftwidth=3 softtabstop=3 expandtab

""" FORTRAN SYNTAX
let fortran_free_source=1 "use free form
let fortran_have_tabs=1
let fortran_fold_conditionals=1
let fortran_fold=1
let fortran_fold_multilinecomments=1
" let fortran_more_precise=1

