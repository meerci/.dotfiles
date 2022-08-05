set clipboard+=unnamed
set incsearch
set ignorecase
set smartcase
set number
set relativenumber


let mapleader=' '

" cursor
noremap H ^
noremap L g_
noremap [ H
noremap ] L
noremap <C-k> 5k
noremap <C-j> 5j
noremap <C-u> 10k
noremap <C-d> 10j
noremap / /\v

" buffer
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

" incident
vnoremap < <gv
vnoremap > >gv

vnoremap p \"_dP

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
noremap Wh :sp<CR>
noremap Wv :vsp<CR>
"switch
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l
noremap Wt :action ActivateTerminalToolWindow<Cr>

noremap Wf :action ActivateProjectToolWindow<Cr>
noremap Ws :action ActivateStructureToolWindow<Cr>

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
