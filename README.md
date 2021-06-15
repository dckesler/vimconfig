# Current setup for vim and tmux

### Install vim with python3 support
- Easiest way for mac users is to just `brew install vim`
- Check `vim --version` afterwards and see that somewhere it says `+python3`

## Installing vimconfig
- Run `git clone https://github.com/dckesler/vimconfig.git ~/.vim`
- (Or the git address of your fork if you forked this)

### Ubuntu Note
Try linuxbrew http://linuxbrew.sh/
Currently not all the packages can be installed via `apt-get`

### Setup steps

init.vim should be symlinked to .vimrc
- Run `ln -s ~/.vim/init.vim ~/.vimrc`

You need tmux
- Run `brew install tmux`

Install this to have tmux and your clipboard be friends
- Run `brew install reattach-to-user-namespace`

tmux.conf should be symlinked to ~/.tmux.conf
- Run `ln -s ~/.vim/tmux.conf ~/.tmux.conf`

Install vundle
- Run `git clone https://github.com/VundleVim/Vundle.Vim ~/.vim/bundle/Vundle.vim`

Install Silver Searcher
- Run `brew install the_silver_searcher`

Install FZF for fuzzy searching
- Run `brew install fzf`
- You'll see a helpful hint at the end something like
```
To install useful keybindings and fuzzy completion:
  /usr/local/opt/fzf/install
```
- Run that and agree to the three questions
- Finally add this line to your shell config
`export FZF_DEFAULT_COMMAND='ag -g ""'`
- That line makes it so FZF will respect your `.gitignore` when searching

Install your vim plugins
- Inside of vim type `:PluginInstall`
- This makes Vundle go through and install all the plugins

Install YouCompleteMe
- After running `:PluginInstall` YouCompleteMe will still complain
- You can follow along the readme [here](https://github.com/ycm-core/YouCompleteMe)
- Go to the `Installation` at `macOS` or whatever you use. On macOS ignore the part about installing `macvim` though

### Custom Vundle Plugins
- Add the file `~/.vim/vundles.custom.vim`.
- Add vim plugins like this `Plugin 'gituser/repo-name'`
- Then run `:PluginInstall`

### Custom Vim Stuff
The directory `custom/` can be filled with any vim files you want and they will all be
loaded into the vim setup. None of that directory is version controlled.

## Tmuxifier
Tmuxifier is a way to have saved tmux window and session layouts (these instructions work for bash or zsh)
Check out the project here https://github.com/jimeh/tmuxifier with more in depth instructions
### Installing Tmuxifier
- `git clone https://github.com/jimeh/tmuxifier.git ~/.vim/tmuxifier`
Now you need to load the tmuxifier PATH
- `echo 'export PATH="$HOME/.vim/tmuxifier/bin:$PATH"' >> <your shell configuration file>`
- `echo 'eval "$(tmuxifier init -)"' >> <your shell configuration file>`

### Adding tmuxifier window layouts
- Add a file to `~/.vim/tmuxifier/layouts/`
- For example `touch ~/.vim/tmuxifier/layouts/example.window.sh`
- Add this code to the file
```bash
new_window "example"
run_cmd "vim"

split_v 20
split_h 50
split_h 50
select_pane 2
split_h 50
```
- Then inside of tmux run `tmuxifier load-window example`
- It should start up something with a large pane opened in vim and 4 smaller panes at the bottom
