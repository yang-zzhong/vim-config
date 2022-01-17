
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!
set nu
set ts=4
set sw=4
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b
syntax on
set autoindent
set encoding=utf8

if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Courier\ Bold\ 12
  elseif has("gui_photon")
    set guifont=Courier\ New:s12
  elseif has("gui_kde")
    set guifont=Courier\ New/12/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h16
    set linespace=1
  endif
endif

%retab!

set updatetime=100

set nocompatible
filetype plugin indent on

filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Install Vim-go  
Plugin 'fatih/vim-go'  
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'whatyouhide/vim-gotham'
Plugin 'jonsmithers/vim-html-template-literals'
Plugin 'pangloss/vim-javascript'
Plugin 'hashivim/vim-terraform'
Plugin 'kyoz/purify', { 'rtp': 'vim' }
Plugin 'preservim/tagbar'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Use release branch (recommend)
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nmap <C-R> :NERDTreeToggle<CR>

let g:NERDTreeQuitOnOpen = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:htl_css_templates = 1
let g:htl_all_templates = 1

autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4 
autocmd BufNewFile,BufRead *.js setlocal expandtab tabstop=2 shiftwidth=2 
autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=2 shiftwidth=2 
autocmd BufNewFile,BufRead *.css setlocal expandtab tabstop=2 shiftwidth=2 

" fold
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

set expandtab
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set background=dark

" colorscheme gotham
colorscheme purify

" install powerline and set guifont=powerline_font
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" tagbar
nmap <C-J> :TagbarToggle<CR>

set scrolloff=5
