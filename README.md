### NOTE
Almost nothing is documented or commented, because im too lazy to do so.

### Quickstart
```shell
git clone https://github.com/netfri25/neovim-config ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim # Installs packer
```
If it tells you that the directory already exists and its empty, you should remove it completely (meaning your previous config will be gone) and try running the command again

After the installation, opening neovim will result in an error.
Ignore the error and run `:PackerSync` inside neovim and next time you open it everything will work perfectly.
