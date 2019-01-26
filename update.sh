#!/usr/bin/env bash

\cp -r ~/.i3 .
\cp -r ~/.themes .
\cp ~/.gtkrc-2.0 .
\cp ~/.profile .
\cp ~/.spacemacs .
\cp ~/.Xclients .
\cp ~/.xinitrc .
\cp ~/.zshrc .

mkdir -p ./.config

\cp -r ~/.config/alacritty ./.config/
\cp -r ~/.config/gtk-3.0 ./.config/
\cp -r ~/.config/neofetch ./.config/
\cp -r ~/.config/polybar ./.config/
\cp -r ~/.config/rofi ./.config/
