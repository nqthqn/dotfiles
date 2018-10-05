if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'elmcast/elm-vim'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ervandew/supertab'
Plug 'elixir-lang/vim-elixir'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
" <c-y>, to expand -  ul>li*3
Plug 'mattn/emmet-vim'
" colorscheme
Plug 'jacoborus/tender.vim'
call plug#end()

" Diable annoying audio bell
set visualbell

" Quick window motion mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" display the line!
set cursorline

" too lazy to hit tab
set smartindent

" 4 space tabs as spaces
set shiftwidth=4
set tabstop=4
set expandtab

set number

" i <3 pablo piocasso
syntax enable
colorscheme pablo
"set bg=dark

" ? I forget what this does
set laststatus=2

map <C-n> :NERDTreeToggle<CR>

function! ToggleForCopy() 
    set list! 
    set number! 
   " set relativenumber! 
endfunction 

nmap <silent> \p :call ToggleForCopy()<CR>

set listchars=tab:▸\ ,eol:¬

" toggle the paste mode
set pastetoggle=<F2>

" highlight searches
" set hlsearch


" auto format elm code on save
let g:elm_format_autosave=1
let g:elm_format_fail_silently=1

" a pretty airline tabline for tabs and buffers
let g:airline#extensions#tabline#enabled = 1
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|node_modules\|elm-stuff|',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

set backspace=indent,eol,start

" use dots
let g:gitgutter_sign_added = '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_removed_first_line = '·'
let g:gitgutter_sign_modified_removed = '·'

" ALE linter settings
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
