" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

" Enfocado
" Plug 'wuelnerdotexe/vim-enfocado'

" gruvbox
Plug 'morhetz/gruvbox'

" Github Copilot
Plug 'github/copilot.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
nmap <F10> :NERDTreeToggle<CR>

" Gitgutter
Plug 'airblade/vim-gitgutter'

" Fugitive
Plug 'tpope/vim-fugitive'

" Airline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set backspace=indent,eol,start

""" coc.nvim

" Tab or enter to complete
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\t"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Keep gutter up
set signcolumn=yes

" Lower update time
set updatetime=100

"""

" F12 / Shift-F12 to navigate buffers
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" Theme
set termguicolors
set background=dark
" let g:enfocado_style = 'neon'
" colorscheme enfocado
autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Change error highlighting
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000

" Column Number Change
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = "\u33c7"

set tabstop=4
set shiftwidth=4
set cindent
set smartindent
set expandtab
set number
syntax on

" Incrementally search while typing
set incsearch
" " Use smart case for searching
set ignorecase
set smartcase
" " Highlight searches
set hlsearch
" " Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
