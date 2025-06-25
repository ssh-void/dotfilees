"my config
highlight CursorLine ctermbg=Black cterm=NONE
highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Green

"namp
nmap J <C-w>h
nmap M <C-w>l

"noremap
noremap <silent> l k
noremap <silent> k j
noremap <silent> m l
noremap <silent> j h

"inoremap
inoremap jk <Esc>
inoremap kj <Esc>

"vnoremap
vnoremap < <gv
vnoremap > >gv
:vmap <Tab> >
:vmap <S-Tab> <

syntax enable
"set
set title
set ruler
set showmatch
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
"set cursorcolumn
set backupcopy=yes
set shiftwidth=4
set diffopt+=iwhite
set autoindent
set smartindent
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set encoding=utf-8
set rnu
set wildmode=longest,list,full
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set undofile
set undodir=/tmp
set nowritebackup
set updatetime=300
set signcolumn=yes
set number
set noswapfile
set noundofile
set laststatus=0

"color
colorscheme koehler

"nnoremap
nnoremap <C-s> :vsplit<CR> "ctrl +s

"leader
let mapleader = "!"
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>

"xclip
vnoremap <C-c> "+y
map <C-v> "+v

nnoremap <A-x> :s/^/\" /<CR>
vnoremap <A-x> :s/^/\" /<CR>

augroup ManPage
    autocmd!
    autocmd FileType man setlocal nowrap              " Désactiver le retour à la ligne automatique
    autocmd FileType man setlocal syntax=man          " Activer la coloration syntaxique
    autocmd FileType man setlocal foldenable          " Activer le pliage
    autocmd FileType man setlocal foldmethod=indent   " Pliage basé sur l'indentation
    autocmd FileType man setlocal foldlevel=99        " Tout déplier par défaut
    autocmd FileType man setlocal scrolloff=3         " Marge autour du curseur
    autocmd FileType man setlocal laststatus=0        " Cacher la barre de statut
    autocmd FileType man setlocal number              " Afficher les numéros de ligne
    autocmd FileType man setlocal signcolumn=no       " Cacher la colonne de signes
    autocmd FileType man setlocal nocursorline        " Pas de surlignage de la ligne du curseur
    autocmd FileType man setlocal colorcolumn=        " Pas de colonne de repère
    autocmd FileType man silent! colorscheme elflord   " Appliquer un thème adapté (éviter les erreurs)
    autocmd FileType man call s:SetManColors()
augroup END

" Passer au buffer suivant avec Ctrl + →
nnoremap <C-Right> :bn<CR>
" Revenir au buffer précédent avec Ctrl + ←
nnoremap <C-Left> :bp<CR>

function! s:SetManColors()
"   highlight Normal guibg=#333333
    highlight Normal guibg=#222222
"   highlight Normal guibg=#45403D
"   highlight Normal guibg=#300A24
endfunction

"highlight Normal guibg=#333333
highlight Normal guibg=#222222
"highlight Normal guibg=#45403D
"highlight Normal guibg=#300A24

