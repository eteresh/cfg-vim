# Literature, casts on vim
- This repo keeps vim-config according to the tutorial: https://www.atlassian.com/git/tutorials/dotfiles
- Drew Neil "Practical vim"
- Drew Neil "Modern vim"

# Cheatsheet for cloning from github and for syncing updates from github

## Clone vim-config repo
```shell
git clone --bare https://github.com/eteresh/cfg-vim.git $HOME/.cfg/vim
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME checkout master
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME config --local status.showUntrackedFiles no
```

## Synchronize config repo
```shell
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME fetch
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME pull
```

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


# Create vim-config repo
1. Create a new empty repository on github.

2. Clone empty repository and (optionally) disable showing untracked files:
```shell
git clone --bare git@github.com:eteresh/cfg-vim.git $HOME/.cfg/vim
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME config --local status.showUntrackedFiles no
```

3. Add `.vimrc` with base settings. For example, you can add following lines into `$HOME/.vimrc`:
```vim
" Initialize vim defaults
source $VIMRUNTIME/defaults.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
```
make first commit:
```shell
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME add $HOME/.vimrc
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME commit -m 'add .vimrc'
```
push your commit to github:
```shell
git --git-dir=$HOME/.cfg/vim --work-tree=$HOME push origin master
```

4. I strongly recommend you to add a readme with `git`-commands to clone your repo from github and to synchronize cloned repo with github. It will help you to keep up to date version of your vim-configuration on all machines you work.

Congrats! After these simple steps you have a base repo with vim-configuration. Now you can customize vim, commit, push to github, pull from github on all your machines using standard git workflow.


# Plugins
## Add minpac plugin manager
Run in shell:
```shell
mkdir -p $HOME/.vim/pack/minpac/opt
cd $HOME/.vim/pack/minpac/opt
git clone https://github.com/k-takata/minpac.git
```

Add to your .vimrc:
```vim
" Initialize minpac to load vim plugins
" ==========================================================================
packadd minpac
call minpac#init()
command! PackUpdate call minpac#update()
command! PackStatus call minpac#status()
command! PackClean call minpac#clean()
" ==========================================================================

" Plugins
" ==========================================================================
call minpac#add('k-takata/minpac', {'type': 'opt'})
" ==========================================================================
```

