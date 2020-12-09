# shadovim
A repo to hold all my up to date nvim configuration files

## Installation
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
    ```:CocInstall coc-calc coc-clangd coc-cmake coc-highlight coc-markdownlint coc-git coc-fzf-preview coc-html coc-json coc-sh coc-tabnine coc-texlab coc-vimlsp coc-yaml coc-yank coc-snippets```
3. Finally, close nvim and reopen once more... all the plugins should now be installed!
