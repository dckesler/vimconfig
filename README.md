# Current setup for vim and tmux

## Installing
- Run `git clone https://github.com/dckesler/vimconfig.git ~/.vim`
- (Or the git address of your fork if you forked this)

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

## NeoVim
### Installing neovim - (On Mac)
- `brew install neovim/neovim/neovim`

The command `nvim` should exist now, you could alias `vim` to `nvim` if you want.

Now you'll want python3 enabled for neovim to use the autocomplete functionality
- If you don't have python3 run `brew install python3`
- You should now have pip3
- Run `pip3 install neovim`
- Run the command `:echo has("python3")` inside of neovim
- If it returns `1` you're in business
- Now run `:UpdateRemotePlugins` to enable deoplete (the autocomplete plugin)
- If it returns `0` this page could help https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim

Now you need neovim to run your vim settings
- Run `mkdir ~/.config` (Unless you already have said directory)

Now symlink a `nvim` directory in here to your `.vim` directory (this repo)
- Run `ln -s ~/.vim ~/.config/nvim`

You may also want to edit your `.gitconfig` to use nvim as your editor
- Add these lines
```
[core]
	editor = nvim
```

### custom.vim
`custom.vim` is a non-version-controlled file. Add things here you want outside of git.
Most likely the first things will be your colorscheme.
`colorscheme <name>`

### ctrl+h tmux bug
If you're setting up NeoVim on Mac for the first time you should run the commands
```
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```
As per https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
Otherwise `ctrl + h` won't switch between panes in tmux

## Tmuxifier
Tmuxifier is a way to have saved tmux window and session layouts (these instructions work for bash or zsh)
Check out the project here https://github.com/jimeh/tmuxifier with more in depth instructions
###Installing Tmuxifier
- `git clone https://github.com/jimeh/tmuxifier.git ~/.vim/tmuxifier`
Now you need to load the tmuxifier PATH
- `echo 'export PATH="$HOME/.vim/tmuxifier/bin:$PATH"' >> <your shell configuration file>`
- `echo 'eval "$(tmuxifier init -)"' >> <your shell configuration file>`

###Adding tmuxifier window layouts
- Add a file to `~/.vim/tmuxifier/layouts/`
- For example `touch ~/.vim/tmuxifier/layouts/example.window.sh`
- Add this code to the file
```bash
new_window "example"
rm_cmd "vim"

split_v 20
split_h 50
split_h 50
select_pane 2
split_h 50
```
- Then inside of tmux run `tmuxifier load-window example`
- It should start up something with a large pane opened in vim and 4 smaller panes at the bottom
