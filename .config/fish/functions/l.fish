function l 
   echo $argv | read -l command
   
   if [ -z "$command" ]
         ls --sort extension ./
   else
         ls --sort extension $command 
   end  
end

