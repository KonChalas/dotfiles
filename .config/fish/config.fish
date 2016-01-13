set fisher_home ~/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
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

alias lock='i3lock -c 000000'
alias emc='emacsclient -c -a ""'

set -Ux fish_user_paths $fish_user_paths ~/Workspace/gcc-linaro-4.9-2014.11-x86_64_aarch64-linux-gnu/bin ~/go/bin

set -Ux GOPATH ~/go

set -Ux EDITOR vim

set -g theme_display_vi yes
set -g theme_date_format "+"
set -g theme_display_git no

# Load fishmarks (http://github.com/techwizrd/fishmarks)
. ~/.config/fisherman/functions/marks.fish
