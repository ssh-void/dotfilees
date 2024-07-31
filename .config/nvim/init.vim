" Configuration de base
syntax enable
set number
"set rnu
set title  " tested 
set ruler " (interer enn nveovim)
set showmatch
set ignorecase " tested ( mais pour mois intule)
set incsearch " ne ne compepas
set hlsearch " v
set bs=2 " je pas compri bs5 Invalide value
set nobackup
set scrolloff=10 " tested autilser
set splitright " tested
"set cursorline
"set cursorcolumn " tested
set backupcopy=yes
set bg=dark
set shiftwidth=4
set diffopt+=iwhite " Ignore whitespace whilst diffing
set autoindent
set smartindent
" Activer la complétion automatique lors de la saisie
set wildmenu
set wildmode=full
" Couleur du thème
colorscheme evening
" Enregistrement automatique des fichiers toutes les 5 minutes
set autowrite
set autowriteall
set updatetime=300
" Recherche incrémentielle
set incsearch
set hlsearch
" Configuration de la gestion des espaces
set backspace=indent,eol,start
" Configuration de l'indentation pour certains types de fichiers
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType html,xml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript,json setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab
" color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
" k vers le bas L vers haut m vers le droit j vers la gouch
noremap <silent> l k
noremap <silent> k j
noremap <silent> m l
noremap <silent> j h
" jk or kj echap
inoremap jk <Esc>
inoremap kj <Esc>
" tap en maode vu   
vmap <Tab> >
vmap <S-Tab> <
vnoremap < <gv
vnoremap > >gv
" f8 vérifer le orthographique 
map <F8> :setlocal spell! spelllang=en_gb<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR> "ctrl+f
nnoremap <TAB> :bnext<CR> "TAB
nnoremap <C-s> :vsplit<CR> "ctrl +s 
nnoremap <C-m> :make<CR>   "ctrl +m => $ make
"tab stuff tested
nnoremap tn :tabnew<Space> "t+n
nnoremap tk :tabnext<cr> "t+k
nnoremap tj :tabprev<cr> "t+j
nnoremap th :tabfirst<cr> "t+h
nnoremap tl :tablast<cr> "t+l
" trak changer
set undofile
set undodir=/tmp
" copier colé
vnoremap <C-c> "+y
map <C-v> "+v
"vim ne créé de .swp	
set noswapfile " tested
" Redimensionner les fenêtres verticalement
nnoremap <C-l> :vertical resize -2<CR>
nnoremap <C-k> :vertical resize +2<CR>
" Navigation entre les fenêtres
nmap J <C-w>h
nmap M <C-w>l
set laststatus=0 " spermier la bare
