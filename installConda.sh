#!/bin/bash
# Install miniconda
source ./conda/installMiniconda.sh

# Now conda charge!
# Basic build setup
conda install -y -c conda-forge cmake
conda install -y -c conda-forge clangdev

# pandoc
conda install -y -c conda-forge pandoc
# Suggest install system dependent (brew install gpg or yum install gnupg)
# conda install -y -c conda-forge gnupg

# Vim
conda install -y -c conda-forge neovim
conda install -y -c daizeng1984 nvim

# Nodejs
conda install -y -c conda-forge nodejs

# Boostrap java
conda install -y -c daizeng1984 sdkman

# C++
conda install -y -c conda-forge conan
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
conda install -y -c daizeng1984 ccls

# ruby
# native lib via bundler always requires lib path from conda, not friendly at all
# has to use system ruby
# conda install -y -c conda-forge ruby

# Web tools
conda install -y -c conda-forge httpie

# Tmux
conda install -y -c conda-forge tmux
# Fix https://github.com/conda-forge/tmux-feedstock/issues/12
conda install -y -c conda-forge ncurses

# Misc
conda install -y -c conda-forge fzf
# TODO: fzf recipe is not complete
mkdir -p $HOME/.dotfiles/.local/lib/miniconda/share/fzf/plugin
wget https://raw.githubusercontent.com/junegunn/fzf/master/plugin/fzf.vim -P $HOME/.dotfiles/.local/lib/miniconda/share/fzf/plugin

conda install -y -c conda-forge rsync
conda install -y -c conda-forge trash-cli
conda install -y -c conda-forge ripgrep
conda install -y -c conda-forge the_silver_searcher
conda install -y -c antoined xsel
conda install -y -c daizeng1984 fasd
conda install -y -c conda-forge fd-find
conda install -y -c bioconda grep # make sure we have organic grep on mac
conda install -y -c conda-forge patool

# TODO: separate Non-conda
# Vim/tmux
source $HOME/.dotfiles/neovim/configNeovim.sh
source $HOME/.dotfiles/tmux/configTmux.sh
# TODO: anaconda ranger
pip install ranger-fm
# TODO: backup 
# autocomplete ignore case for bash
# echo "set completion-ignore-case On" >> $HOME/.inputrc

# Install zsh (requires git TODO)
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
