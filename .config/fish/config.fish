if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set SPACEFISH_PROMPT_ADD_NEWLINE false

# Theme
theme_gruvbox "dark" "hard"

# Aliases
alias l="exa --long --icons --sort=ext --classify"
alias ll="exa --long --icons --sort=ext --classify"
alias la="exa --long --all --icons --sort=ext --classify"
alias lll="exa --long --icons --sort=ext --header --created --modified --classify"
alias lla="exa --long --all --icons --sort=ext --header --created --modified --classify"

alias tree="exa --tree --long --icons --level=2 --extended --classify"

# source the general aliases file
source ~/.aliases

# choose the default nvm LTS
nvm use lts

# add some spacer
#echo ''
#echo ''

# neofetch to show summary of computer state
#neofetch
