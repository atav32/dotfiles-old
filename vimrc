" Formatting Goodness
:set viminfo='10,\"100,:20,%
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set smartindent
:set softtabstop=4
:set number
:syntax on

" Navigation between Splits (doesn't work in Secure Shell)
:map <C-e> <C-w>

" Paste and then keep text in paste buffer
:nnoremap p pgvy

" Center screen on cursor
:nnoremap <Enter> zz

" Remap tab to auto-complete
:inoremap <Tab> <C-N>

" Alt-space to ESC to normal mode
:imap <M-Space> <Esc>

" Remap space to fold/unfold code
:nmap <Space> za

" Remap :Q to :q
:command Q q

" Remap :W to :w
:command W w

" Commit to mercurial (just type the message between the quotes)
:nmap gc :silent !hg com -m ""<Left>

" Save
:nnoremap gs :w<Enter>
:nnoremap gS :wq<Enter>

" Code folding
set foldmethod=indent
set foldnestmax=3
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

