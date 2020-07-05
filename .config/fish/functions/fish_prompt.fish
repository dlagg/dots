function fish_prompt
#	set_color $fish_color_cwd
	set_color ff002b

	echo -n (basename $PWD)
	set_color 3eff00 
#	echo -n ' ) '
	echo -n ' 🗲 '
end
