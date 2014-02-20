" Color Scheme Slate (but doesn't work correctly Secure Shell or tmux)
set term=xterm-256color
colorscheme slate

" Tab settings
set expandtab          " Expand tabs into spaces
set smarttab           " Allow for easy backspace of tabs
set tabstop=4          " Use 4 spaces for tabs
set softtabstop=4      " Use 4 spaces for soft tabs
set shiftwidth=4       " Make shift same as a tab

" Search settings
set hlsearch           " Highlight results
set incsearch          " Start showing results while typing
set ignorecase         " Ignore case in searched
set smartcase          " Use case in search with capitals

" Formatting Goodness
set autoindent
set smartindent
set number
set ruler
set history=500
set showmatch
set showcmd " display incomplete commands
set autoread

set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set term=cons25
set splitbelow         " Default splits to below
set splitright         " Default vsplits to the right
set title              " Set title for gvim
set t_Co=256           " Force 256 colors

" Navigation between Splits (You don't want to hit Ctrl-W in Secure Shell)
map <C-e> <C-w>

" Short cuts for split nav
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l


" Hit Enter to center screen on cursor
:nnoremap <Enter> zz

" Remap tab to auto-complete
:inoremap <Tab> <C-N>

" Remap E to insert after end of word
:nnoremap E ea

" Remap typos
:command Q q
:command W w
:command Wq wq

" Commit to mercurial (just type the message between the quotes)
:nmap gc :silent !hg com -m ""<Left>
  
" Save
:nnoremap gs :w<Enter> 
:nnoremap gS :wq<Enter> 

" Map ctrl-space to escape
:inoremap <C-Space> <Esc>
  
" Remap ctrl-[ to ctrl-T
:nmap <C-[> <C-T>

" Remap space to fold/unfold code
:nmap <Space> za

" Code folding
set foldnestmax=10
set foldmethod=syntax  " Fold based on syntax
set foldlevel=999      " Start with folds open
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Show filename in status
set ls=2

" Bell
set visualbell

" Back up
set noswapfile

" Insert one character
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" Clear the terminal after VIM exits
au VimLeave * :!clear
