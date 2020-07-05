function batstat 
  upower -d | grep -e percentage -e capacity	
end
