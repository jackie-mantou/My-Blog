
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" number
set number

" tab is equal to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" set tab to 4 spaces
set expandtab

" set tags for camera project
"set tags=~/suanpan-c/devices/instrument/camera_new/tags

" set foldcolumn
set foldcolumn=3

" set auto mkview and loadview
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" set coding order
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

" set autoindent
set autoindent

" set filetype
filetype plugin on

" abbreviation
ab #e		****************************************/
ab #b		/****************************************
ab {        {}
ab /*       /* */

" colorscheme desert
colorscheme desert

" vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" normal mode map
nnoremap <F9> :w<CR>
nnoremap <F10> :q<CR>
nnoremap <F11> :qa<CR>
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j
nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l

" set dictionary
set dictionary+=/usr/share/dict/words
