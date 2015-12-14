fish_vi_mode
function my_vi_bindings
	fish_vi_key_bindings
	bind -M insert \cl 'clear; commandline -f repaint'
end
set -g fish_key_bindings my_vi_bindings

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

alias lock='i3lock -c 000000'

set -Ux EDITOR vim

set -g theme_display_vi yes
set -g theme_date_format "+"
