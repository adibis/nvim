# neovim Configuration Directory

Sensible neovim configuration. Contains settings from [vim-sensible](https://github.com/tpope/vim-sensible) along with my own changes.

## Installation and Upgrades

Install:

    cd
    git clone git://github.com/adibis/nvim.git ~/.config/nvim
    nvim +PlugInstall +qall

Update:

    cd ~/.config/nvim
    nvim +PlugUpgrade +PlugUpdate +PlugClean +qall

*NOTE:* neovim sometimes freezes when updating like this. In that case please run neovim and then manually run the three commands listed above.

More stuff will be added as the neovim project matures.
