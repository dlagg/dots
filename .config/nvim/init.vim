let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set cursorline
" Toogle keybind for line Numbers
"nmap <silent> <F2> :set rnu! nu! number?<CR>
"nnoremap <silent> <F2> :set rnu! | set nu! number?<CR>
"nnoremap <n> :set rnu! | set nu! number?<CR>
set nu rnu

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"setlocal spell
setlocal spelllang=es
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile ~/DAW/PROYECTO-FINAL-DAW/todo.md setlocal nospell

   call plug#begin('~/.config/nvim/plugged')

   " Make sure you use single quotes

   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
   Plug 'junegunn/vim-easy-align'

   " Any valid git URL is allowed
   Plug 'https://github.com/junegunn/vim-github-dashboard.git'

   " Multiple Plug commands can be written in a single line using | separators
   "Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

   " On-demand loading
   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

   " Using a non-master branch
   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
   Plug 'fatih/vim-go', { 'tag': '*' }

   " Plugin options
   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

   " Plugin outside ~/.vim/plugged with post-update hook
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

   " Unmanaged plugin (manually installed and updated)
   Plug '~/my-prototype-plugin'

   " Initialize plugin system
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'chrisbra/Colorizer'
   Plug 'preservim/nerdtree'
   Plug 'pangloss/vim-javascript'
   Plug 'Chiel92/vim-autoformat'
   Plug 'simeji/winresizer'
   Plug 'jelera/vim-javascript-syntax'
   Plug 'honza/vim-snippets'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'sheerun/vim-polyglot'
   Plug 'luochen1990/rainbow'
   Plug 'brooth/far.vim'

   "THEMES
   Plug 'zeis/vim-kolor'
   Plug 'sainnhe/edge'
   Plug 'severij/vadelma'
   Plug 'rakr/vim-one'
   call plug#end()

"let g:edge_style='neon'
colo one
let g:airline_theme='one'
let g:colorizer_auto_filetype='css,html'

"NerdTree 
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Rainbow
let g:rainbow_active = 1
"Cosas de coc.nvim

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"map /  <Plug>(incsearch-forward)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

