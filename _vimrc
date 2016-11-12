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

" << -= My code starts here. =- >>

" --------------VISUAL IMPROVEMENTS--------------
" Make the GUI mode look better on a wide modern screen.
" Also puts it in the left side, it's how I usually work.
if has("gui_running")
  " GUI is running or is about to start.
  " A bigger window on 1980x1080
  set lines=100 columns=118
  " Put it to the upper left-side corner of the screen:
  winpos 0 0  
else
  " This is console Vim.
  " While here, make Delek the default color scheme (works better in console).
  colo delek
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" Set the preferred color scheme and a dark background (I got sight related issues).
set background=dark
colo solarized

" Set the font. I like Luxi Mono a lot, it's so clean and organized.
" Linux:
" set guifont=Luxi\ Mono\ 10
" Windows:
set guifont=Luxi\ Mono:h10

" I don't really need the GUI elements, I rather not use the mouse at all.
set guioptions+=lrb " no right scrollbar
set guioptions-=lrb	" no bottom scrollbar
set guioptions-=T	" no toolbar
set guioptions-=m	" no menubar

" Tab bar behaviour
set showtabline=0   " no tabbar
" 1 = show tabbar only if more than one file is opened. (Default)
" 0 = No tabbar even if more than one file is opened. (No Tab Bar)
" 2 = Show tabbar even if only one file is opened. (Always Show)

" Enable line numbers.
set nu

" I like syntax on by default.
syntax on

" --------------MOVEMENT IMPROVEMENTS--------------
" Navigate between window splits with Ctrl + Movement keys (j, k, l, h)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Insert newline without entering Insert mode
nmap <S-Enter> O<Esc>j      " insert newline above with Shift + Enter
nmap <CR> o<Esc>k           " insert newline below with Enter

" --------------EDITING IMPROVEMENTS--------------
" Search settings.
set wrap            " wrap-around mode
set ignorecase      " ignore case when searching
"set hlsearch        " highlight the search

" Enable mouse.
set mouse=a

" Set autoindent.
set autoindent

" TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" No need in being paranoid and I dislike clutter in folders.
set noswapfile
set nobackup

" --------------CODING IMPROVEMENTS--------------
" Indent/Unindent with: >> / <<
" In Visual mode works with a single character: > or <
nmap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nmap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nmap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>