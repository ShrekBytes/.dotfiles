#!/bin/bash

# Dependencies:
# - pgrep: To check if Alacritty is running
# - xdotool: To interact with windows (e.g., getting window IDs, focusing windows)
# - wmctrl: To switch between desktops
# - xprop: To get properties of windows (e.g., which desktop a window is on)

# Function to raise and focus a window
raise_and_focus_window() {
    local WIN_ID=$1
    xdotool windowraise $WIN_ID
    xdotool windowactivate --sync $WIN_ID
}

# Check if Alacritty is running
if ! pgrep -x "alacritty" > /dev/null; then
    # If Alacritty is not running, start it
    alacritty &
else
    # If Alacritty is running, get its window ID (first match)
    WIN_ID=$(xdotool search --class "Alacritty" | head -n 1)
    
    # Get the current desktop number (the one currently focused)
    CURRENT_DESKTOP=$(wmctrl -d | grep '\*' | cut -d ' ' -f1)
    
    # Get the desktop ID of Alacritty's window using xprop
    WINDOW_DESKTOP=$(xprop -id $WIN_ID | grep "_NET_WM_DESKTOP" | awk '{print $3}')

    # Desktop 6 is index 5 (since desktops are 0-based)
    STORAGE_DESKTOP=5

    if [ "$WINDOW_DESKTOP" = "$CURRENT_DESKTOP" ]; then
        # If Alacritty is already on the current desktop
        ACTIVE_WIN=$(xdotool getactivewindow)
        
        if [ "$ACTIVE_WIN" = "$WIN_ID" ]; then
            # If Alacritty is focused, send it to desktop 6
            wmctrl -ir $WIN_ID -t $STORAGE_DESKTOP
        else
            # If Alacritty is not focused, bring it to the front and focus it
            raise_and_focus_window $WIN_ID
        fi
    else
        # If Alacritty is on a different desktop, move it to the current desktop
        wmctrl -ir $WIN_ID -t $CURRENT_DESKTOP
        
        # After moving it, raise and focus the window to bring it to the front
        raise_and_focus_window $WIN_ID
    fi
fi













# #!/bin/bash
# # Check if Alacritty is running
# if ! pgrep -x "alacritty" > /dev/null; then
#     # If Alacritty is not running, start it
#     alacritty &
# else
#     # If Alacritty is running, get its window ID
#     WIN_ID=$(xdotool search --class "Alacritty" | head -n 1)
#     # Check if Alacritty is on desktop 6
#     DESKTOP=$(xprop -id $WIN_ID | grep "_NET_WM_DESKTOP" | awk '{print $3}')
#     # Get the current desktop number
#     CURRENT_DESKTOP=$(wmctrl -d | grep '\*' | cut -d ' ' -f1)
#
#     # Desktop 6 is index 5 (since desktops are 0-based)
#     STORAGE_DESKTOP=5
#
#     if [ "$DESKTOP" = "$CURRENT_DESKTOP" ]; then
#         # If Alacritty is on current desktop
#         ACTIVE_WIN=$(xdotool getactivewindow)
#
#         if [ "$ACTIVE_WIN" = "$WIN_ID" ]; then
#             # If Alacritty is focused, send it to desktop 6
#             wmctrl -ir $WIN_ID -t $STORAGE_DESKTOP
#         else
#             # If Alacritty is not focused, bring it to front
#             xdotool windowraise $WIN_ID
#             xdotool windowactivate --sync $WIN_ID
#         fi
#     else
#         if [[ "$DESKTOP" -eq "$STORAGE_DESKTOP" ]]; then
#             # If Alacritty is on desktop 6, bring it to current desktop
#             wmctrl -ir $WIN_ID -t $CURRENT_DESKTOP
#         else
#             # If Alacritty is on any other desktop, bring it to current desktop
#             wmctrl -ir $WIN_ID -t $CURRENT_DESKTOP
#         fi
#         # After moving, raise and focus the window
#         xdotool windowraise $WIN_ID
#         xdotool windowactivate --sync $WIN_ID
#     fi
# fi
