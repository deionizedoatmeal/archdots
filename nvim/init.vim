set number
set ruler
syntax enable           " enable syntax processin
set tabstop=4       " number of visual spaces per TAB
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

"au BufEnter * :hi EndOfBuffer ctermbg=guibg ctermfg=guibg guibg=guibg guifg=guibg
"au BufEnter * :Minimap
"au BufEnter * :hi VertSplit ctermbg=guibg ctermfg=guibg

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

"Plug 'norcalli/nvim-colorizer.lua'
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'sirver/ultisnips'
call plug#end()

"vim tex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:EasyClipShareYanks=1

"utilsnips
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"colors
colorscheme wal

"pdf latex
let g:livepreview_previewer = 'zathura'

"tex conceal
set conceallevel=2
let g:tex_conceal="abdgm"
