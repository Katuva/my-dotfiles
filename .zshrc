POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found

alias lc='colorls -l --sd'
alias lca='colorls -lA --sd'
alias e='nvim'
alias nano='nvim'
alias vim='nvim'

neofetch

POWERLEVEL9K_MODE="nerdfont-complete"

antigen theme bhilburn/powerlevel9k powerlevel9k

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{black}%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{blue}%F{black} \uf155 %f%F{blue}%k\ue0b0%f "

POWERLEVEL9K_CUSTOM_SKULL_ICON_FOREGROUND="yellow"
POWERLEVEL9K_CUSTOM_SKULL_ICON_BACKGROUND="237"
POWERLEVEL9K_CUSTOM_MANJARO_ICON_FOREGROUND="yellow"
POWERLEVEL9K_CUSTOM_MANJARO_ICON_BACKGROUND="237"

POWERLEVEL9K_OS_ICON_FOREGROUND="yellow"
POWERLEVEL9K_OS_ICON_BACKGROUND="237"

POWERLEVEL9K_STATUS_OK_BACKGROUND="237"

POWERLEVEL9K_CUSTOM_SKULL_ICON="echo $'\ue231 '"
POWERLEVEL9K_CUSTOM_MANJARO_ICON="echo $'\uf312 '"

POWERLEVEL9K_TIME_FORMAT="%t"
POWERLEVEL9K_TIME_BACKGROUND="blue"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_skull_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time custom_manjaro_icon)

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
