
highlight Comment cterm=italic
highlight CursorLine ctermbg=Black cterm=NONE
highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Green

nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>

nnoremap <C-l> 		:vertical resize -2<CR>
nnoremap <C-k> 		:vertical resize +2<CR>
nmap J <C-w>h
nmap M <C-w>l
" k vers le bas L vers haut m vers le droit j vers la gouch
noremap <silent> l k
noremap <silent> k j
noremap <silent> m l
noremap <silent> j h

"map <leader>c :!pdflatex % && !zathura %:p:r.pdf &<CR>
" jk or kj echap
inoremap jk <Esc>
inoremap kj <Esc>
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

vnoremap < <gv
vnoremap > >gv
:vmap <Tab> >
:vmap <S-Tab> <
" f8 vérifer le orthographique
map <F8> :setlocal spell! spelllang=en_gb<CR>

syntax enable
set title
set ruler
set showmatch
" color
set t_Co=256        " Enable 256 colors
set termguicolors   " Enable GUI colors for the terminal to get truecolor
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup
set scrolloff=5
set splitright
set cursorline
set cursorcolumn
set backupcopy=yes
set bg=dark
set shiftwidth=4
set diffopt+=iwhite
set autoindent
set smartindent
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set nocompatible
set encoding=utf-8
"set number relativenumber
set wildmode=longest,list,full
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set undofile
set undodir=/tmp
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
" Recherche incrémentielle
set number
set incsearch
set hlsearch
filetype indent on
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> :vsplit<CR> "ctrl +s
nnoremap <C-m> :make<CR>   "ctrl +m => $ make
let mapleader =":" " touche leader à ! au lieu de la valeur par défaut espace

" Auto Install Vim Plug
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'luochen1990/rainbow'                         " Parenthéses arc-en-ciel
Plug 'majutsushi/tagbar'                           " Tag viewer for navigating code structures
Plug 'sheerun/vim-polyglot'                        " Syntax highlighting for multiple programming 
Plug 'vim-python/python-syntax'
Plug 'itchyny/lightline.vim'                       " Lightline statusbar
Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }     " color theme
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox' " color theme

call plug#end()

let g:python_highlight_all = 1
autocmd FileType sxhkd setlocal syntax=on
colorscheme gruvbox
"colorscheme catppuccin
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
" Always show statusline
set laststatus=2
"Coc
let g:coc_global_extensions = [
    \ 'coc-clangd' 
    \  ]
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  
" Désactiver la complétion native de Vim pour éviter les conflits
set completeopt=menuone,noinsert,noselect
set shortmess+=c
" Déclencher automatiquement la complétion lors de la saisie
inoremap <silent><expr> <A-Space> coc#refresh()
" Configurer Coc pour utiliser l'autocomplétion dès que vous commencez à taper
autocmd CursorHoldI * silent! call coc#float#hide()

"xclip
vnoremap <C-c> "+y
map <C-v> "+v

"==============================================
" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

autocmd BufWritepre * %s/\n\+\%$//e
autocmd BufWritePost files,directories !shortcuts
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Configuration spécifique aux fichiers de type man
augroup ManPage
  autocmd!
  autocmd FileType man setlocal nowrap              " Désactiver le retour à la ligne automatique
  autocmd FileType man setlocal syntax=man          " Activer la coloration syntaxique pour les pages man
  autocmd FileType man setlocal foldenable          " Activer le pliage de code pour les pages man
  autocmd FileType man setlocal foldmethod=indent   " Utiliser le pliage basé sur l'indentation
  autocmd FileType man setlocal foldlevel=1         " Niveau de pliage initial
  autocmd FileType man setlocal scrolloff=3         " Garder un espace de 3 lignes au-dessus et en dessous du curseur
  autocmd FileType man setlocal laststatus=0        " Supprimer la barre de statut pour les pages man
  autocmd FileType man colorscheme catppuccin          " Appliquer le thème manpage
augroup END

" Désactiver les fichiers de swap
set noswapfile
" Désactiver les fichiers de sauvegarde
set nobackup
set nowritebackup
" Désactiver les fichiers temporaires
set noundofile
