" Color Scheme Slate (but doesn't work correctly Secure Shell or tmux)
colorscheme slate

" Formatting Goodness
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set ruler
set history=500
set showmatch
set showcmd " display incomplete commands
set autoread
set incsearch
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set term=cons25

" Navigation between Splits (Ctrl-W doesn't work in Secure Shell)
:map <C-e> <C-w>

" Center screen on cursor
:nnoremap <Enter> zz

" Remap tab to auto-complete
:inoremap <Tab> <C-N>

" Remap E to insert after end of word
:nnoremap E ea

" Remap :Q to :q
:command Q q

" Remap :W to :w
:command W w

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
set foldmethod=indent
set foldnestmax=10
set foldlevel=99
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
