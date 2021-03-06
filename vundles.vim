" Required by vundle
filetype off

" Set runtimepath for vundle
set rtp+=~/.vim/bundle/Vundle.vim

"Start Vundle
call vundle#begin()
"" Add vundle packages here

" Vundle loads vundle
Plugin 'VundleVim/Vundle.vim'

" Utils
Plugin 'itchyny/lightline.vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

"" Languages
" Polyglot does a lot of languages
Plugin 'sheerun/vim-polyglot'
" vim-flavored-markdown helps recognize github markdown styles
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'chrisbra/Colorizer'

"" File Management
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'skwp/greplace.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/camelcasemotion.git'
Plugin 'vim-scripts/matchit.zip'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dense-analysis/ale'

"" Git
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-git'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'

" Custom Plugins in ./vundles-custom.vim
if filereadable(expand('~/.vim/vundles.custom.vim'))
  source ~/.vim/vundles.custom.vim
endif


call vundle#end()



" Required by vundle
filetype plugin indent on
