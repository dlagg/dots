#wpr -> change random 1 or 2 monitors
#wp  -> detect nº monitors and select 
#Detection mons
xrandr --listactivemonitors
#get random wallp files
shuf
#select from input
find /wallp/path | sxiv -tio #hjkl=move,m=sel,q=quit
#set wp
feh --bg-fill /path/to/wp.png --bg-fill /path/to/wp2.png
