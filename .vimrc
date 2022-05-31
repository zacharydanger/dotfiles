" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
" if has("syntax")
  " syntax on
" endif

" execute pathogen#infect()

call plug#begin()

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Easy alignment for like Ruby hashes
Plug 'junegunn/vim-easy-align'

" coffeescript support
Plug 'kchmck/vim-coffee-script'

" Rails goodies
Plug 'tpope/vim-rails'

" Ruby help
Plug 'vim-ruby/vim-ruby'

" Rainbow CSV -- column color coordination
Plug 'mechatroner/rainbow_csv'

" Rename files in place
Plug 'danro/rename.vim'

" Auto close brackets, etc
" Plug 'tmsvg/pear-tree'

" recommended plugins
" Plug 'itchyny/lightline.vim' " https://github.com/itchyny/lightline.vim
" Plug 'tpope/vim-surround'    " https://vimawesome.com/plugin/surround-vim

" Git stuff
Plug 'tpope/vim-fugitive'

" Helpful comment line toggles
Plug 'preservim/nerdcommenter'

Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

" packadd! indentLint

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" configure NERDCommenter
let g:NERDSpaceDelims = 1

" let g:ctrlp_extensions = ['tag']

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set term=screen-256color-bce
set number
set ruler
syntax enable
let g:solarized_termcolors=256
" let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

filetype plugin on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set ttymouse=sgr

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" automagically remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" set binary noeol

:autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>

:set backspace=indent,eol,start

:set viminfo='50,<1000,s100,:0,n~/.viminfo'

"au BufRead,BufNewFile *.js set ts=4

au BufRead,BufNewFile *.json set filetype=json

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.scss set et
au BufRead,BufNewFile *.scss set sw=2
au BufRead,BufNewFile *.scss set sts=2
au BufRead,BufNewFile *.scss set smarttab

au BufRead,BufNewFile *.php set et
au BufRead,BufNewFile *.php set sw=2
au BufRead,BufNewFile *.php set sts=2
au BufRead,BufNewFile *.php set smarttab
"au BufRead,BufNewFile *.php set tabstop=4
" au BufRead,BufNewFile *.php set expandtab!


au BufNewFile,BufRead {Vagrantfile,Gemfile,Rakefile,Capfile,Guardfile,*.rake,*.jbuilder,*.builder} set filetype=ruby

au BufRead,BufNewFile *.rb set et
au BufRead,BufNewFile *.rb set sw=2
au BufRead,BufNewFile *.rb set sts=2
au BufRead,BufNewFile *.rb set smarttab

au BufRead,BufNewFile *.coffee set et
au BufRead,BufNewFile *.coffee set sw=2
au BufRead,BufNewFile *.coffee set sts=2
au BufRead,BufNewFile *.coffee set smarttab

au BufRead,BufNewFile *.inky set filetype=erb

au BufRead,BufNewFile *.ts set sw=4
au BufRead,BufNewFile *.ts set sts=4
au BufRead,BufNewFile *.ts set smarttab

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

set foldlevelstart=20
set path=**

" open vertical splits to the right ->|
set splitright

" open horizontal splits down
set splitbelow

" ctrl+T open fuzzy file finder
map <C-T> :Files<CR>
noremap <Leader>g :Rg<CR>

" Luke's macro for changing Ruby hashrockets to modern hash syntax
noremap <Leader>r :s/:\(\w\+\)\(\s*\)=>\s*/\1:\2/g<Cr>

" fix syntax probz re: typescript
set re=0
