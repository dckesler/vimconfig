" Check to see if you need to install vim-plug first
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Start vim-plug
call plug#begin('~/.vim/plugs')

"" Add plugins here

" Utils
Plug 'itchyny/lightline.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" Polyglot does a lot of language syntax
Plug 'sheerun/vim-polyglot'
Plug 'jtratner/vim-flavored-markdown'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" File Management
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/IndexedSearch'
Plug 'nelstrom/vim-visual-star-search'

Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/camelcasemotion'
Plug 'christoomey/vim-tmux-navigator'

"" Git
Plug 'tpope/vim-git'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Custom Plugins in ./plugs.custom.vim
if filereadable(expand('~/.vim/plugs.custom.vim'))
  source ~/.vim/plugs.custom.vim
endif

call plug#end()
