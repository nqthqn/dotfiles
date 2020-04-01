" Plugins
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'takac/vim-hardtime'
call plug#end()

" Use hard time!
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 4
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

" basics
set noerrorbells                                " disable audio bell
set nocompatible                                " disable backward compatability with vi
set backspace=indent,eol,start                  " make backspace work like normal
syntax enable                                   " syntax highlighting 
filetype plugin on                              " for netrw (file browser)
set hlsearch                                    " highlight matches
nnoremap ,<space> :nohlsearch<CR>               " toggle highlights
set listchars=tab:▸\ ,eol:¬                     " for set list!
set colorcolumn=80
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

" get rid of anoying swp files
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile


" tab completion for file tasks
set wildmenu                                    " tab auto complete menu
set path+=**                                    " look in subfolders

" ignore things when autocompleting
set wildignore+=**/node_modules/** 

" file browser
let g:netrw_banner=0                            " disable annoying banner
let g:netrw_browse_split=4                      " open in prior window
let g:netrw_altv=1                              " opens split to the right
let g:netrw_liststyle=3                         " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()    " hide files that are git ignored
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'

" nicer typing
set autoindent

" buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr> 

" snippets
nnoremap ,html :-1read ~/code/snips/skeleton.html<cr>
nnoremap ,ico :-1read ~/code/snips/icon.html<cr>f_a

" get out of insert mode faster
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" pretty
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" 4 space tabs as spaces
set shiftwidth=4
set tabstop=4
set expandtab

" hybrid line numbers
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

" Quick window motion mappings
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" enable mouse mode
set mouse=a

" Use line cursor and cursorline in INSERT mode
" https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" make search matches more subtle
highlight Search ctermbg=black ctermfg=yellow term=underline

" Sane Ignore For ctrlp 
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|node_modules\|elm-stuff\|dist|', 
            \ 'file': '\.exe$\|\.so$\|\.dat$'
            \ }

" Use rip grp for ctrlp
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" better git gutter colors
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" autoformat file
nmap <leader>i mmgg=G`m
