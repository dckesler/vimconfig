# Current setup for vim and tmux

## Installing vimconfig
- Run `git clone https://github.com/dckesler/vimconfig.git ~/.vim`
- (Or the git address of your fork if you forked this)

### Mac setup steps

init.vim should be symlinked to .vimrc
- Run `ln -s ~/.vim/init.vim ~/.vimrc`

You need tmux
- Run `brew install tmux`

Install this to have tmux and your clipboard be friends
- Run `brew install reattach-to-user-namespace`

tmux.conf should be symlinked to ~/.tmux.conf
- Run `ln -s ~/.vim/tmux.conf ~/.tmux.conf`

Install Ripgrep to use with the `:Rg` fzf command
- Run `brew install ripgrep`

Install your vim plugins
- Start up vim (it should automatically install vim-plug and then all the plugins inside `plugs.vim`)

Install additonal coc extensions via `:CocInstall` as you please
- e.g. coc-tsserver, coc-prettier, coc-eslint, coc-html, coc-css, coc-json

### Custom Vim Plugins
- Add the file `~/.vim/plugs.custom.vim`.
- Add vim plugins to that file like this `Plug 'gituser/repo-name'`
- Then run `:PlugInstall`

### Custom Vim Stuff
The directory `custom/` can be filled with any vim files you want and they will all be
loaded into the vim setup. None of that directory is version controlled.
