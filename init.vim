call plug#begin('~/.config/nvim/plugged')

" Plugins {
    " ctrl-p is a fuzzy file finder.
    Plug 'kien/ctrlp.vim'
    " lightline is a status line for nvim.
    Plug 'itchyny/lightline.vim'
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
    set breakindent         " Indent line-breaks at the same level as code.

    set ttimeoutlen=100
" }

" Search {
    set ignorecase          " Make searching case insensitive
    set smartcase           " ... unless the query has capital letters.
    set gdefault            " Use 'g' flag by default with :s/foo/bar/.

    " Use <C-L> to clear the highlighting of :set hlsearch.
    if maparg('<C-L>', 'n') ==# ''
        nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
    endif
" }

" Formatting {
    set showmatch           " Show matching brackets.
    set number              " Show the line numbers on the left side.
    set formatoptions+=o    " Continue comment marker in new lines.
    set expandtab           " Insert spaces when TAB is pressed.
    set tabstop=4           " Render TABs using this many spaces.
    set shiftwidth=4        " Indentation amount for < and > commands.

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

    " Path/file expansion in colon-mode.
    set wildmode=list:longest

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
    nmap <Leader>k :tabnext<CR>
    nmap <Leader>j :tabprevious<CR>
    nmap <tab> <C-w>w

    " Manage split sizes
    map <leader>ww <C-w>_
    map <leader>w\ <C-w>|
    map <leader>we <C-w>=
    map <leader>w- <C-w>-
    map <leader>w= <C-w>+

" }


" Experimental {
    " Search and Replace
    nmap <Leader>s :%s//g<Left><Left>
" }

" Plugin Settings {
    " neomake {
        let g:neomake_warning_sign={'text': '◆'}
        let g:neomake_error_sign={'text': '✗'}
        autocmd! BufWritePost * Neomake
        nnoremap <Leader>n :lopen<CR>
    " }
    " Lightline {
        let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ 'active': {
        \   'left': [['mode', 'paste'], ['filename', 'modified']],
        \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors']]
        \ },
        \ 'component_expand': {
        \   'linter_warnings': 'LightlineLinterWarnings',
        \   'linter_errors': 'LightlineLinterErrors'
        \ },
        \ 'component_type': {
        \   'readonly': 'error',
        \   'linter_warnings': 'warning',
        \   'linter_errors': 'error'
        \ },
        \ }
        function! LightlineLinterWarnings() abort
            let l:counts = neomake#statusline#LoclistCounts()
            let l:warnings = get(l:counts, 'W', 0)
            return l:warnings == 0 ? '' : printf('%d ◆', l:warnings)
        endfunction

        function! LightlineLinterErrors() abort
            let l:counts = neomake#statusline#LoclistCounts()
            let l:errors = get(l:counts, 'E', 0)
            return l:errors == 0 ? '' : printf('%d ✗', l:errors)
        endfunction

        " Ensure lightline updates after neomake is done.
        autocmd! User NeomakeFinished call lightline#update()
    " }
    " CtrlP {
        " Open file menu
        nnoremap <Leader>o :CtrlP<CR>
        " Open buffer menu
        nnoremap <Leader>b :CtrlPBuffer<CR>
        " Open most recently used files
        nnoremap <Leader>f :CtrlPMRUFiles<CR>
    " }
    " netrw {
        let g:netrw_liststyle=3 " tree (change to 0 for thin)
        let g:netrw_banner=0    " no banner
        let g:netrw_altv=1      " open files on right
        let g:netrw_winsize=80  " only use 20% screen for netrw
        " FIXME: Preview opens to left and is very narrow
        let g:netrw_preview=1   " open previews vertically
    " }
" }

" vim:set ft=vim sw=4 ts=4:
