# Configuration
This configuration is my personal laptop/desktop setup repo originally inspired from: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/ and now it grows into a bootstrap setup for my working environments (mainly linux/mac) and this bootstrap unlike [Laptop](https://github.com/thoughtbot/laptop), it heavily relies on [conda](https://daizeng1984.github.io/jekyll/update/2018/11/18/conda-everything.html).

# Before
Basic development tools like git, wget, curl, bzip2 e.g. `yum group install "Development Tools"`. However, unless given a minimum OS installation, that shouldn't worry us too much since most normal OS setup should already have them all so you basically don't need to do anything. However in MacOS, you need to make sure git, wget is installed. If not you need to install from `brew`.

# Get Started
Simply do: `cd && git clone https://github.com/daizeng1984/dotfiles.git .dotfiles && cd .dotfiles && bash ./createSymlink.sh && source ~/.bashrc && source ./installConda.sh`

Note: currently troubling OS like Windows (Cygwin/MingW) only has minimum support from these script and a lot of error messages are expected.

# After

## TODO: Desktop
### Centos
```{bash}
sudo source $HOME/.dotfiles/misc/installCentos7Desktop.sh
```

### Mac OS X
```{bash}
source $HOME/.dotfiles/mac/installMacDesktop.sh
```
## Key Mapping

On Linux, you need to disable gnome terminal's [F10 key bindings](https://ubuntu-tutorials.com/2007/07/16/disabling-the-f10-key-menu-accelerators-in-gnome-terminal/), disable Capslock in `TweakTool`.

## Better Vim
To install Language Support in Neovim run 

```{bash}
$HOME/.dotfiles/misc/installNeovimLanguageServers.sh`
```
