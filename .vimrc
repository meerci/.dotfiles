set clipboard^=unnamed,unnamedplus
set incsearch
set ignorecase
set smartcase
set number
set relativenumber
set noswapfile

if &term =~ "xterm" || exists('$TMUX')
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[2 q"
endif


let mapleader=' '

" cursor
noremap H ^
noremap L g_
noremap <C-k> 5k
noremap <C-j> 5j
noremap <C-u> 10k
noremap <C-d> 10j
vmap p \"_dhp
noremap / /\v

" buffer
noremap { :bn<CR>
noremap } :bp<CR>

map <leader>t :terminal<CR>
map <leader>e :Lexplore<CR>
map <leader>E :Explore<CR>

" incident
vnoremap < <gv
vnoremap > >gv

noremap gv <C-V>
" noremap M :action ParameterInfo<Cr>
" noremap Q :action ReformatCode<Cr>:w<Cr>
" noremap gr :action RenameElement<Cr>
" noremap ga :action GotoAction<Cr>
" noremap gz :action ToggleZenMode<Cr>
" noremap gn :action GotoNextError<Cr>
" noremap gp :action GotoPreviousError<Cr>
" noremap E :action ShowErrorDescription<Cr>


" window
"split
noremap - :sp<CR>
noremap \| :vsp<CR>
"switch
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l

"size
noremap <A-=> <C-w>=
noremap <A-Left>, :vertical resize -2<CR>
noremap <A-Right>, :vertical resize +2<CR>
noremap <A-Down>, :resize +2<CR>
noremap <A-Up>, :resize -2<CR>
" close current
noremap Wc <C-w>c
" close other
noremap Wo <C-w>o


"vim marks
" m{bookmark-name}                create a mark. upper is global mark
" `{bookmark-name}                goto line:col
" '{bookmark-name}                goto line
" :marks                          list marks
" :delmarks {bookmark-name}       delete marks

map gm `
map M :marks<CR>
"map dm :delmarks 

"vim jump
" C-o    go back
" C-i    go forward
map [ <C-o>
map ] <C-i>
