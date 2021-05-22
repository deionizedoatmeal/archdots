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
" let g:loaded_matchparen=1
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
"""space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"""apply terminal transparency to status line
" :hi statusline cterm=bold ctermfg=3 ctermbg=6 gui=NONE
" :hi statusline guibg=NONE gui=NONE guifg=NONE 
:set laststatus=0
:set cmdheight=1

"""fix for yankring and neovim
" let g:clipboard=0

"""system clipboard
" vnoremap <C-c> "*y
" vnoremap <C-c> "+y
" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p
set clipboard=unnamedplus

" line wrapping toggling
:function ToggleWrap()
: if (&wrap == 1)
:   set nowrap
: else
:   set wrap
: endif
:endfunction

map <C-w> :call ToggleWrap()<CR>
map! <C-w> [:call ToggleWrap()<CR>


"plugins
call plug#begin('~/.config/nvim/plugs')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
Plug 'tmsvg/pear-tree'
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'

"currently unsed plugins
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'sirver/ultisnips'
" Plug 'svermeulen/vim-easyclip'
" Plug 'yuttie/comfortable-motion.vim'
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

"utilsnips
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"colors
colorscheme wal

" make comments italic
" highlight Comment cterm=italic gui=italic

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
nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>

" scrolling
" let g:comfortable_motion_scroll_down_key = "j"
" let g:comfortable_motion_scroll_up_key = "k"
" let g:comfortable_motion_scroll_down_key = "<Down>"
" let g:comfortable_motion_scroll_up_key = "<Up>"

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


" fortran syntax
let fortran_free_source=1 "use free form
let fortran_have_tabs=1
let fortran_fold_conditionals=1
let fortran_fold=1
let fortran_fold_multilinecomments=1
let fortran_more_precise=1

