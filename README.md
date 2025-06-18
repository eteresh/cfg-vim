## Sources:
- Drew Neil [Practical Vim](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)
- Drew Neil [Modern Vim](https://pragprog.com/titles/modvim/modern-vim/)
- Tutorial on [organizing dot-files](https://www.atlassian.com/git/tutorials/dotfiles)
- Josean Martinez [tutorial](https://www.josean.com/posts/how-to-setup-neovim-2024), [config](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim)
- Mario Carrion [tutorial](https://www.youtube.com/watch?v=n5_WLgxwkU8), [config](https://github.com/MarioCarrion/videos/blob/e5ab66c3f75ea31373567892defc84be1f730546/2024/nvim-configuration)

## Install
Run in shell:
```shell
git clone --bare https://github.com/eteresh/cfg-vim.git $HOME/.cfg/vim
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME checkout master
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME config --local status.showUntrackedFiles no
```
Neovim at first run would install all plugins.

## Troubleshouting
If your .vimrc settings or plugins go crazy and don't let you normally use vim, just run vim without any config and plugins:
```
vim -u NONE -N
```
where `-N` option means to use vim in **nocompatible** mode.
Also with `-u` option you can specify which config to use instead of default `$HOME/.vimrc`. For example:
```
vim -u $HOME/your_base_vim_config.vim
```
