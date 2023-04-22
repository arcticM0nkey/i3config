#####################################################################################################################
#################                          Define the $mod variable/key                             #################
#####################################################################################################################

# Key to rule them all : Super(Windows) or Alt key?

# Mod4 = Windows or Super key on keyboard
# Mod1 = Alt key on keyboard

#Set Alt key
#set $mod Mod1

#set Super key
set $mod Mod4

#This is setup for qwerty
set $up l
set $down k
set $left j
set $right semicolon

font pango: Source Code Pro 12 
# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9

bindsym $mod+d exec rofi -show drun -c ~/.config/rofi/config.rasi --theme

bindsym $mod+0 mode "$mode_system"

set $mode_system System (k) lock, (l) logout, (u) suspend, (h) hibernate, (r) reboot, (s) shutdown
mode "$mode_system" {

    bindsym k exec --no-startup-id ~/.config/i3/scripts/i3exit.sh lock, mode "default"
    bindsym l exec --no-startup-id ~/.config/i3/scripts/i3exit.sh logout, mode "default"
    bindsym u exec --no-startup-id ~/.config/i3/scripts/i3exit.sh suspend, mode "default"
    bindsym h exec --no-startup-id ~/.config/i3/scripts/i3exit.sh hibernate, mode "default"
    bindsym r exec --no-startup-id ~/.config/i3/scripts/i3exit.sh reboot, mode "default"
    bindsym s exec --no-startup-id ~/.config/i3/scripts/i3exit.sh shutdown, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}




# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# reload the configuration file
bindsym $mod+Shift+c reload



# kill focused window
bindsym $mod+Shift+q kill


# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus
bindsym $mod+$left focus left
bindsym $mod+$down focus down
bindsym $mod+$up focus up
bindsym $mod+$right focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+$left move left
bindsym $mod+Shift+$down move down
bindsym $mod+Shift+$up move up
bindsym $mod+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right


bindsym Mod1+Tab workspace next
bindsym Mod1+Shift+Tab workspace prev
bindsym $mod+Tab workspace back_and_forth

#navigate workspaces next / previous
bindsym Mod1+Ctrl+Right workspace next
bindsym Mod1+Ctrl+Left workspace prev


# Make the currently focused window a scratchpad
bindsym $mod+Shift+minus move scratchpad

# Show the first scratchpad window
bindsym $mod+minus scratchpad show



# orientation for new workspaces
default_orientation horizontal

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# Enter fullscreen mode for the focused container
# Super + F in arcolinux is execute thunar
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
# qwerty/azerty issue for letter z
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split


# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent



bindsym $mod+r mode "resize"

mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
       bindsym $left       resize shrink width 10 px or 10 ppt
       bindsym $down       resize grow height 10 px or 10 ppt
       bindsym $up         resize shrink height 10 px or 10 ppt
       bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
       bindsym Left        resize shrink width 1 px or 1 ppt
       bindsym Down        resize grow height 1 px or 1 ppt
       bindsym Up          resize shrink height 1 px or 1 ppt
       bindsym Right       resize grow width 1 px or 1 ppt

        # back to normal: Enter or Escape
       bindsym Return mode "default"
       bindsym Escape mode "default"
}


bindsym $mod+Return exec --no-startup-id kitty;focus

bindsym control+mod1+u exec --no-startup-id pavucontrol

bindsym $mod+Shift+Return exec --no-startup-id ranger;focus




bindsym Print exec maim -s --format png /dev/stdout | xclip -selection clipboard -t image/png -i
bindsym $mod+Print exec maim --select | tee ~/Pictures/$(date +%s).png | xclip -sel c -t image/png

bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status



# Sreen brightness controls
bindsym XF86MonBrightnessUp exec light -A 1 # increase screen brightness
bindsym XF86MonBrightnessDown exec light -U 1 # decrease screen brightness



# bar toggle, hide or show
bindsym $mod+b bar mode toggle

bindsym $mod+i bar mode invisible





for_window [class="^.*"] border pixel 1
gaps inner 10
gaps outer 1

set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"

mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
        bindsym i      mode "$mode_gaps_inner"
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

mode "$mode_gaps_inner" {
        bindsym plus  gaps inner current plus 5
        bindsym minus gaps inner current minus 5
        bindsym 0     gaps inner current set 0

        bindsym Shift+plus  gaps inner all plus 5
        bindsym Shift+minus gaps inner all minus 5
        bindsym Shift+0     gaps inner all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_outer" {
        bindsym plus  gaps outer current plus 5
        bindsym minus gaps outer current minus 5
        bindsym 0     gaps outer current set 0

        bindsym Shift+plus  gaps outer all plus 5
        bindsym Shift+minus gaps outer all minus 5
        bindsym Shift+0     gaps outer all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}



#if you want transparency on non-focused windows, ...
exec_always --no-startup-id picom --config ~/.config/i3/picom.conf
exec_always --no-startup-id feh --bg-center ~/Pictures/wallpapers/wallpaper.jpg
exec_always --no-startup-id ~/.config/i3/scripts/mouse.sh
exec_always --no-startup-id xrandr --output eDP-1 --brightness 0.3
exec_always --no-startup-id setxkbmap -model pc105 -layout us,ru, -option grp:win_space_toggle

#colors
set $colordark #191919
set $verdigris #52bbb7
set $darkterracotta #ca4862

# Color variables
set $unfocused_border #ef4862
set $focused_border #52bbb7

bar {
	height 25
        position top
	status_command i3status	
	font pango:OperatorMono Nerd Font 12
	tray_padding 4
        separator_symbol "  "
 	colors {
                separator $darkterracotta
                background $colordark
                statusline #839496
                #                       border          backg           text
                focused_workspace       $verdigris      $verdigris      $colordark
                active_workspace        $verdigris      $verdigris      $colordark
                inactive_workspace      #32312d         #32312d         $verdigris
                urgent_workspace        #d33936         #d33936         #fdf6e3
        }
}

# class                 border  backgr. text    indicator child_border
client.focused          #ffffff #ffffff #ffffff #ffffff   $focused_border
client.focused_inactive #ffffff #ffffff #ffffff #ffffff   $unfocused_border
client.unfocused        #ffffff #ffffff #ffffff #ffffff   $unfocused_border
client.urgent           #ffffff #ffffff #ffffff #ffffff   $focused_border
client.placeholder      #ffffff #ffffff #ffffff #ffffff   #ffffff

client.background       #ffffff

exec xset r rate 300 20 &
