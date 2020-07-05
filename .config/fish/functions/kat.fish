function kat
   echo $argv | read -l command
   ccat --bg="dark" $command 
end


