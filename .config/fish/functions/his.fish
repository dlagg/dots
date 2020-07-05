function his
	history | dmenu -l 40 | awk '{system($0)}'
end

