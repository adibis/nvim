call plug#begin('~/.config/nvim/plugged')

" Plugins {
  " ctrl-p is a fuzzy file finder.
  Plug 'kien/ctrlp.vim'
  " airline is a better status line and a tab-bar for nvim.
  Plug 'bling/vim-airline'
  " gruvbox colorscheme. Seems to work the best for me.
  Plug 'morhetz/gruvbox'
  " neomake is a code linting tool that runs in the background.
  Plug 'neomake/neomake'
" }

call plug#end()

" Map the leader key to ,
let mapleader="\<SPACE>"

" General {
  set noautoindent        " I indent my code myself.
  set nocindent           " I indent my code myself.
  "set smartindent        " Or I let the smartindent take care of it.

  set ttimeout
  set ttimeoutlen=100
" }

" Search {
  set ignorecase          " Make searching case insensitive
  set smartcase           " ... unless the query has capital letters.
  set gdefault            " Use 'g' flag by default with :s/foo/bar/.
  set magic               " Use 'magic' patterns (extended regular expressions).

  " Use <C-L> to clear the highlighting of :set hlsearch.
  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  endif
" }

" Formatting {
  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set showmode            " Show current mode.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them.
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=2           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set esckeys             " Cursor keys in insert mode.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

  " More natural splits
  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.

  if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
  endif
  if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
  endif
  set nostartofline       " Do not jump to first character with page commands.

  " Tell Vim which characters to show for expanded TABs,
  " trailing whitespace, and end-of-lines. VERY useful!
  if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  endif
  set list                " Show problematic characters.
" }

" Configuration {
  set autochdir           " Switch to current file's parent directory.

  " Remove special characters for filename
  set isfname-=:
  set isfname-==
  set isfname-=+

  " Map ; to :
  nnoremap ; :

  if &undolevels < 200
    set undolevels=200    " Number of undo levels.
  endif

  " Path/file expansion in colon-mode.
  set wildmode=list:longest
  set wildchar=<TAB>

  " Allow color schemes to do bright colors without forcing bold.
  if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
  endif

  " Remove trailing spaces.
  function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
  endfunction
  " FIXME: Do not call this on makefile and sv files.
  autocmd BufWritePre * call TrimWhitespace()
  nnoremap <leader>W :call TrimWhitespace()<CR>

  " Diff options
  set diffopt+=iwhite

  "Enter to go to EOF and backspace to go to start
  nnoremap <CR> G
  nnoremap <BS> gg
  " Stop cursor from jumping over wrapped lines
  nnoremap j gj
  nnoremap k gk
  " Make HOME and END behave like shell
  inoremap <C-E> <End>
  inoremap <C-A> <Home>
" }

" UI Options {
  " Colorscheme options.
  set bg=dark
  colorscheme gruvbox

  " Also highlight all tabs and trailing whitespace characters.
  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  match ExtraWhitespace /\s\+$\|\t/

  " Relative numbering
  function! NumberToggle()
    if(&relativenumber == 1)
      set nornu
      set number
    else
      set rnu
    endif
  endfunc

  " Toggle between normal and relative numbering.
  nnoremap <leader>r :call NumberToggle()<cr>
" }

" Keybindings {
  " Save file
  nnoremap <Leader>w :w<CR>

  " Copy and paste from system clipboard (Might require xsel/xclip install)
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P

  " Move between buffers
  nmap <Leader>l :bnext<CR>
  nmap <Leader>h :bprevious<CR>
" }


" Experimental {
  " Search and Replace
  nmap <Leader>s :%s//g<Left><Left>
" }

" Plugin Settings {
  " Airline {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_theme= 'gruvbox'
  " }
  " CtrlP {
    " Open file menu
    nnoremap <Leader>o :CtrlP<CR>
    " Open buffer menu
    nnoremap <Leader>b :CtrlPBuffer<CR>
    " Open most recently used files
    nnoremap <Leader>f :CtrlPMRUFiles<CR>
  " }
  " neomake {
    autocmd! BufWritePost * Neomake
    nnoremap <Leader>l :lopen<CR>
  " }
  " neomake {
    let g:netrw_liststyle=3 " tree (change to 0 for thin)
    let g:netrw_banner=0    " no banner
    let g:netrw_altv=1      " open files on right
    let g:netrw_winsize=80  " only use 20% screen for netrw
    " FIXME: Preview opens to left and is very narrow
    let g:netrw_preview=1   " open previews vertically
  " }
" }

" vim:set ft=vim sw=2 ts=2:
