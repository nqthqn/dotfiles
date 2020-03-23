" basics
set nocompatible                                " disable backward compatability with vi
set backspace=indent,eol,start                  " make backspace work like normal
syntax enable                                   " syntax highlighting 
filetype plugin on                              " for netrw (file browser)
set cursorline                                  " show the line
set hlsearch                                    " highlight matches
nnoremap ,<space> :nohlsearch<CR>               " toggle highlights
set listchars=tab:▸\ ,eol:¬                     " for set list!

" tab completion for file tasks
set wildmenu                                    " tab auto complete menu
set path+=**                                    " look in subfolders

" file browser
let g:netrw_banner=0                            " disable annoying banner
let g:netrw_browse_split=4                      " open in prior window
let g:netrw_altv=1                              " opens split to the right
let g:netrw_liststyle=3                         " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()    " hide files that are git ignored
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'

" buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr> 

" snippets
nnoremap ,html :-1read ~/code/snips/skeleton.html<CR>

" pretty
set t_Co=256
" https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
colorscheme molokai

" 4 space tabs as spaces
set shiftwidth=4
set tabstop=4
set expandtab

" set number

" Quick window motion mappings
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

