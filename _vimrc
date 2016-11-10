set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" my code starts here
syntax on
set nu
set wrap
set ignorecase
set hlsearch
set mouse=a
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set guioptions+=lrb
set guioptions-=lrb	" no scrollbars
set guioptions-=T	" no toolbar
set guioptions-=m	" no menubar
set noswapfile
set nobackup
set background=dark
colo solarized
" Linux:
" set guifont=Luxi\ Mono\ 10
"Windows:
set guifont=Luxi\ Mono:h10
" set lines=100 columns=118 
" a better solution:
if has("gui_running")
  " GUI is running or is about to start.
  " A bigger window on 1980x1080
  set lines=100 columns=118
else
  " This is console Vim.
  colo delek
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" insert newline w/o entering Insert mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k