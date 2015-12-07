"" Use Vim settings, jrather then Vi settings (much better!).
"" This must be first, because it changes other options as a side effect.
set nocompatible
execute pathogen#infect()
filetype off                  " required
call vundle#begin()
Plugin 'vim-scripts/taglist.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'carlobaldassi/ConqueTerm'
Plugin 'scrooloose/nerdcommenter'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'bling/vim-bufferline'
call vundle#end()
let g:bufferline_echo = 0
"autocmd VimEnter *
"  \ let &statusline='%{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()
"
"autocmd BufEnter *
"  \ let &statusline='%{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()
"autocmd BufLeave *
"  \ let &statusline='%{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()
"autocmd BufEnter * set statusline+=%{fugitive#statusline()}

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
"let g:ycm_filetype_specific_completion_to_disable={ 'cpp' :1}
"let g:ycm_show_diagnostics_ui = 0
" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
set pumheight=5
" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set laststatus=2
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set expandtab
set splitright
au InsertLeave * silent execute "set nopaste"

autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""

au InsertEnter  * silent execute "TlistUpdate"
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
nmap <F9> :noh<cr>
let g:term='closed'
function! Conque_open()
  if g:term=='closed'
    ConqueTermVSplit bash
    nmap <F10> :call Conque_close()<cr>
    imap <F10> <ESC><F10>
    let g:term='open'
  endif
endfunction!
function Get_char()
  let s:ch= strpart(getline('.'), 0, 1)
  echom s:ch
endfunction

function! Conque_close()
  if g:term=='open'
    nmap <F10> :call Conque_open()<cr>
    imap <F10> <ESC><F10>
    bd
    let g:term='closed'
  endif
endfunction
nmap <F10> :call Conque_open()<cr>
imap <F10> <ESC><F10>
"hi EasyMotionShade guibg=white ctermfg=white
"highlight Pmenu ctermfg=white ctermbg=lightblue
"highlight PmenuSel ctermfg=white ctermbg=magenta
" Fast saving
nmap q :bd<cr>
" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb
let g:quickfix_is_open = 0
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
"set undodir=~/.vim/backups
"set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

filetype plugin on
filetype indent on
set tags=tags;
" Display tabs and trailing spaces visually
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
function Su()
  if (&ft=='python' || &ft=='cpp')
    try
      silent !ctags %
    endtry
  endif
endfunction

" ================ Folds ============================
function Sub()
  let b:find = inputdialog("find expression to be replaced: ")
  let b:replace = inputdialog("replace expression with: ")
  execute '%s/' . b:find . '/' . b:replace . '/gc'
endfunction
function Save()
 set noshowmode
 update
 sleep 400m
 set showmode
endfunction
imap <C-\> <C-o>:call Save()<cr>

"function s:getPostText()
"  return strpart(getline('.'), col('.') - 1)
"endfunction
function Tab_func()
  let post=strpart(getline('.'), col('.') - 1)
  if post[0]==' '
    echo "post"
  endif
  echo post
endfunction
set foldmethod=syntax   "fold based on indent
set foldnestmax=40       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
nmap <F3> :call Sub()<cr>
" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

imap <C-t> <C-o>:NERDTreeToggle<cr>
nmap <C-t> :NERDTree<cr>
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
"====== My shit =======
" use an orange cursor in insert mode
"  silent !echo -ne \033]12;white\007
	" reset cursor when vim exits
au InsertEnter * set nocursorline
au InsertEnter * set nocursorcolumn
au InsertLeave * set cursorline
autocmd InsertLeave * silent set nopaste
" use an orange cursor in insert mode
  " use a red cursor otherwise
  " reset cursor when vim exits
" use \003]12;gray\007 for gnome-terminal
" use \003	]12;gray\007 for gnome-terminal
set autochdir
let g:session_autosave = 'yes'
nmap <C-e>  :w!<cr>:Errors<CR>
imap <C-e> <Nop>
imap <C-e>  <C-o>:w!<cr><C-o>:Errors<CR>
set pastetoggle=<C-j>
"======= Insert Mode mappings =======
imap <C-f> <esc>:MRU<CR>
nmap <C-f>		:MRU<CR>
"========save?====
set guioptions-=r
set guioptions-=T

set guioptions+=r<Bar><cr>
augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
    au VimEnter * silent call PowerLine()
augroup END
hi SignColumn ctermfg=3 guifg=#93a1a1 guibg=#eee8d5
hi SyntasticErrorLine guifg=red
nmap <C-l> i<C-l><esc>
imap <C-l> <nop>
imap <C-l> <C-o>:TlistOpen<cr>
nmap tt :TlistOpen<cr>
nmap <C-h> :tabp<cr>
nmap <Del> "_d<Right>
imap <C-h> <nop>
imap <C-h> <C-o>:tabp<cr>
nmap <C-b> <nop>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.'), 1 ) == ''
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
function SwithPane()
  let b:pane = inputdialog("move to pane: ")
  execute 'b ' . b:pane
endfunction
function PowerLine()
  Tmuxline powerline
endfunction

nmap <C-b> :call SwithPane()<cr>
set completeopt=menu,longest
colorscheme elflord
hi Visual  guifg=#000000 guibg=white gui=none ctermfg=white
hi MatchParen ctermbg=none ctermfg=red
hi TabLine ctermfg=yellow ctermbg=blue
hi TabLineSel ctermfg=yellow ctermbg=green
set cursorline
hi CursorColumn ctermbg=darkblue
vmap <cr> y
hi TabLine ctermfg=white
let NERDTreeQuitOnOpen=1
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
nmap <F2> <Plug>(easymotion-s)
nmap zz   <Plug>(easymotion-s)
imap <F2> <C-o><F2>
set tabline=%F
set showtabline=2
nmap + :qa!<cr>
nmap <Up> <nop>
nmap <Right> <nop>
nmap <Left> <nop>
nmap <Down> <nop>
nmap <Right> :bn<cr>
nmap <Left> :bp<cr>
let g:bufferline_show_bufnr = 0
let g:Tlist_Close_On_Select = 1
nmap ff <C-]>/. i<cr>:nohls<cr>gf
set path+=/usr/lib/python2.7/site-packages
hi NonText ctermfg=black guifg=black
hi Visual  guibg=LightBlue ctermfg=yellow ctermbg=blue
