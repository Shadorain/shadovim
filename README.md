shadovim
==========

A repo to hold all my up to date nvim configuration files

Installation
==============

- 
- This will cp your current neovim config folder to `~/.nvim.bkp`
- Installs neovim libraries to python3 and npm
- Installs vim-plug plugin manager for vim
```bash
git clone https://github.com/Shadorain/shadovim
mv $HOME/.config/nvim/ ~/.nvim.bkp/
mv shadovim/ $HOME/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
npm install neovim
pip3 install neovim
```

Now that shadovim is installed on the system, we have to do some final patching up withing nvim itself!
1. Open `nvim` and run `:PlugInstall` and allow it to install the few plugins
  - if this step does not work then try opening and closing nvim once more, or make sure that vim-plug is properly installed
2. Then close it (:q) and open `nvim` again, this time run this command: (will install all the COC packages, remove what you will not use from this list now)
```
:CocInstall coc-clangd coc-highlight coc-git coc-sh coc-tabnine coc-yank coc-snippets coc-pairs 
```
3. Then close it and open `nvim` again, this time run this command: (will install all the coc-packages)

Finally for lightline, we simply need to link our custom theme on top of an existing one since lightline doesn't handle custom themes well.
```bash
ln -sf ~/.config/nvim/shado_lightline.vim ~/.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/deus.vim 
 ```

