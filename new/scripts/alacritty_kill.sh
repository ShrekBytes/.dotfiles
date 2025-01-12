#!/bin/bash
echo "Killing Alacritty"

#
#
# #!/bin/bash
#
# # Open Alacritty in the background
# alacritty &
#
# # Wait for 2 seconds
# sleep 2
#
# # Get the PID of the latest Alacritty window (the most recent instance)
# new_pid=$(pgrep -n alacritty)
#
# # Get a list of all Alacritty processes
# pids=$(pgrep alacritty)
#
# # Iterate over each PID and kill all except the new one
# for pid in $pids; do
#   if [[ "$pid" != "$new_pid" ]]; then
#     kill "$pid"
#   fi
# done
