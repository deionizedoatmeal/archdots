set number
set ruler
syntax enable           " enable syntax processin
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4    
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set smarttab
set ai                  " Auto indent
set si                  " Smart indent
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set ttyfast
set showmatch           " highlight matching [{()}]
" let g:loaded_matchparen=1
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

""" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

""" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

""" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""" cursor
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"

set laststatus=0
set cmdheight=1

""" column
" set colorcolumn=80

""" system clipboard
set clipboard=unnamed,unnamedplus

""" line wrapping toggling
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


"plugins
call plug#begin('~/.config/nvim/plugs')
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
" Plug 'svermeulen/vim-easyclip'
" Plug 'morhetz/gruvbox'
" Plug 'psliwka/vim-smoothie'


"currently unsed plugins
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'sirver/ultisnips'
" Plug 'OriolAbril/MESAstro-vim'
" Plug 'severin-lemaignan/vim-minimap'
call plug#end()

"vim tex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_matchparen_enabled=0
let g:vimtex_compiler_progname = 'nvr'

"easy clip settings
" let g:EasyClipShareYanks=1
" nnoremap gm m


"utilsnips
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""" large files

"colors
colorscheme wal
" set termguicolors
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='medium'
" set background=dark
" autocmd vimenter * ++nested colorscheme gruvbox

""" make comments italic
""" kinda hacky but the only way I could make this work lol
" highlight Comment cterm=italic gui=italic
augroup itcom
  autocmd BufNewFile,BufRead *   highlight Comment cterm=italic gui=italic
augroup END

"spellcheck
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
nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>

"mesa syntax
syntax on
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

autocmd FileType fortran setlocal shiftwidth=3 softtabstop=3 expandtab


" fortran syntax
let fortran_free_source=1 "use free form
let fortran_have_tabs=1
let fortran_fold_conditionals=1
let fortran_fold=1
let fortran_fold_multilinecomments=1
let fortran_more_precise=1

