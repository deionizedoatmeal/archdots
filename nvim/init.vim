set number
set ruler
syntax enable           " enable syntax processin
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4    
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

"apply terminal transparency to status line
":hi statusline cterm=bold ctermfg=3 ctermbg=6 gui=NONE
":hi statusline guibg=NONE gui=NONE guifg=NONE 
:set laststatus=0
:set cmdheight=1

"fix for yankring and neovim
let g:clipboard=0

" system clipboard
"vnoremap <C-c> "*y
"vnoremap <C-c> "+y
"noremap <Leader>y "*y
"noremap <Leader>p "*p
"noremap <Leader>Y "+y
"noremap <Leader>P "+p
:set clipboard+=unnamedplus

"plugins
call plug#begin('~/.config/nvim/plugs')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
Plug 'tmsvg/pear-tree'
Plug 'yuttie/comfortable-motion.vim'
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'OriolAbril/MESAstro-vim'

"currently unsed plugins
"Plug 'norcalli/nvim-colorizer.lua'
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'sirver/ultisnips'
call plug#end()

"vim tex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"easy clip settings
let g:EasyClipShareYanks=1

"utilsnips
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"colors
colorscheme wal

"spellcheck
"setlocal spell
set spelllang=en
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <Leader>l :call ToggleSpellCheck()<CR>


"mesa syntax
filetype indent plugin on
