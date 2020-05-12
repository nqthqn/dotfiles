" Plugins
call plug#begin('~/.vim/plugged')
" lang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'elm-tooling/elm-vim'
Plug 'andys8/vim-elm-syntax'
Plug 'vim-scripts/groovy.vim'
Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/CSSMinister'
Plug 'tpope/vim-commentary'
" Indentation
Plug 'Raimondi/YAIFA'
" feel
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" look
Plug 'blerins/flattown'
Plug 'plasticboy/vim-markdown'
Plug 'rbong/vim-crystalline'
Plug 'dunstontc/vim-vscode-theme'
Plug 'cespare/vim-toml'

call plug#end()

" use space as my leader
let mapleader=" "

au BufNewFile,BufRead *jenkins*,Jenkinsfile  setf groovy

" TODO: fix emmet tab stops

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
nnoremap <C-g> :Goyo<CR>
autocmd FileType markdown Goyo
autocmd FileType markdown setlocal spell spelllang=en_gb
" [s to search for misspelled words above the cursor
" ]s to search for misspelled words below the cursor
" z= to see replacement suggestions
" zg to add the word to your dictionary 
autocmd FileType markdown set cursorline
autocmd FileType markdown set conceallevel=2
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

" keep cursor near middle when scrolling
set scrolloff=12

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>

" vim
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>

" quickly update cime config
nmap <leader>v <C-w>v:e ~/.vimrc<cr>

" fzf settings
nmap <leader>o :GFiles!<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>l :Lines<cr>
nmap <leader>c :Commits<cr>
let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" use bat
" https://github.com/junegunn/fzf.vim/pull/707
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat -p --color always {}']}, <bang>0)

" pretty
set termguicolors
colorscheme dark_plus

" easy mode
set mouse=a

" basics
set noerrorbells                  " disable audio bell
set nocompatible                  " disable backward compatability with vi
set backspace=indent,eol,start    " make backspace work like normal
syntax enable                     " syntax highlighting
filetype plugin on                " for netrw (file browser)
set hlsearch                      " highlight matches
nnoremap ,<space> :nohlsearch<cr> " clear highlight
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
" set colorcolumn=80
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed             " use system clipboard
highlight Search guibg=black guifg=yellow gui=underline

" get rid of anoying swp files
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" more natural splitting
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright
" tab completion for file tasks
set wildmenu                                " tab auto complete menu
set path+=**                                " look in subfolders

" ignore things when autocompleting
set wildignore+=**/node_modules/**

" file browser
let g:netrw_banner=0                         " disable annoying banner
let g:netrw_browse_split=2
let g:netrw_winsize=25
let g:netrw_altv=1                           " opens split to the right
let g:netrw_liststyle=3                      " tree view
let g:netrw_list_hide=netrw_gitignore#Hide() " hide files that are git ignored
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'

" nicer typing
set autoindent

" buffers
map gn :bn<cr>
map gp :bp<cr>

" snippets
" TODO: consider using a plugin. emmet works for html
nnoremap ,ico :-1read ~/code/snips/icon.html<cr>f_a

" get out of insert mode faster
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" 4 space tabs as spaces
set shiftwidth=4
set tabstop=4
set expandtab

" hybrid line numbers
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
nmap <F3> :set relativenumber!<cr>

" Quick window motion mappings
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" Use rip grep for ctrlp
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-tsserver',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ ]

" rename
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
" nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>p :Format<cr>
nmap <silent> gd <Plug>(coc-definition)

" dumb autoformat file
nmap <leader>i mmgg=G`m

let g:elm_format_autosave = 1

" Disabled arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
set nowrap



" CoC Recomended Settings
" https://github.com/neoclide/coc.nvim
"
" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" jump back and for with C-o and C-l
" https://github.com/neoclide/coc.nvim/issues/1089#issuecomment-589617614
nnoremap <C-l> <C-i>

nnoremap <silent> <leader>f  :Rg<cr>

" status line
function! StatusLine(...)
    return crystalline#mode() . ' %f%h%w%m%r '
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'default'
set laststatus=2


" Markdown
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1

