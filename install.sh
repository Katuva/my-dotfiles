#!/usr/bin/env bash

sudo pacman -S yay

curl -L git.io/antigen > ~/antigen.zsh

yay -S adobe-source-code-pro-fonts zsh zsh-completions alacritty neofetch feh nomachine firefox firefox-i18n-en-gb ruby rofi polybar npm neovim composer python-pip

chsh -s /usr/bin/zsh

gem install colorls

pip install neovim

composer global require phpmd/phpmd
composer global require squizlabs/php_codesniffer
composer global require phpstan/phpstan

# npm i -g tern

rm -rf ~/.emacs.d

git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

\cp -r ./.i3 ~/
\cp -r ./.themes ~/
\cp ./.gtkrc-2.0 ~/
\cp ./.profile ~/
\cp ./.spacemacs ~/
\cp ./.Xclients ~/
\cp ./.xinitrc ~/
\cp ./.zshrc ~/

\cp -r ./.config/alacritty ~/.config
\cp -r ./.config/gtk-3.0 ~/.config
\cp -r ./.config/neofetch ~/.config
\cp -r ./.config/polybar ~/.config
\cp -r ./.config/rofi ~/.config
\cp -r ./.config/nvim ~/.config

mkdir -p ~/.local/share/fonts

\cp -r ./.local/share/fonts/* ~/.local/share/fonts

echo 'Reboot? (y/n)' && read x && [[ "$x" == "y" ]] && i3exit reboot;
