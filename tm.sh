#!/bin/sh

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || echo "tm.sh does NOT work inside a TMUX session!" 
[ "$TMUX" == "" ] || exit 0
# startup a "default" session if non currently exists
# tmux has-session -t _default || tmux new-session -s _default -d

# present menu for user to choose which workspace to open
TMUXCMD=/usr/local/bin/tmux
PS3="?> "
options=($($TMUXCMD list-sessions -F "#S" 2>/dev/null) "New simple tmux session" "New advanced tmux session" "New Julia Session" "bash-login (no tmux)")

echo " "
echo "tmux[ctrl-a] manager - welcome to <$(hostname)>!"
echo "Make your choice:"
echo " "
select opt in "${options[@]}"
do
	case $opt in
		"New simple tmux session")
			read -p "Enter new TMUX session name: " SESSION_NAME
			$TMUXCMD new -s "$SESSION_NAME"
			break
			;;
        "New advanced tmux session")
            read -p "Enter new TMUX session name: " SESSION_NAME
            $TMUXCMD new -s "$SESSION_NAME" -d 'bash'
			$TMUXCMD split-window -v 'bash'
		    $TMUXCMD -2 attach-session -d 
            break
            ;;
		 "New Julia Session")
		    read -p "Enter new session name: " SESSION_NAME
		    $TMUXCMD new -s "$SESSION_NAME" -d 'vim'
			$TMUXCMD split-window -h 'julia'
			$TMUXCMD -2 attach-session -d 
		    break
		    ;;
		 "bash-login (no TMUX)")
			bash --login
			break;;
		*)
			$TMUXCMD attach-session -t $opt
			break
			;;
	esac
done
