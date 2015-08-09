fish_vi_mode
function my_vi_bindings
	fish_vi_key_bindings
	bind -M insert \cl 'clear; commandline -f repaint'
end
set -g fish_key_bindings my_vi_bindings

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
