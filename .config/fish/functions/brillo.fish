function brillo 
   	echo $argv | read -l command
	lxqt-config-brightness -s $command
end
