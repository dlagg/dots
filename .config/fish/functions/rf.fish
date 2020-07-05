function rf 
  #Comprueba que el output de rfkill list sea nºlineas >6 entonces , añadir otra var l7y8.
  # No sabemos el orden de aparicion de las interfaces.
  # Ni si aparecen 2 o 3 interfaces
  # No podemos cortar igual para mismas posiciones porque las interfaces varian en posicion  
  
    #Saber en que nºlinea esta 0:Bluet y n:Wireless
  set btLineN (rfkill list | grep -n 'tpacpi' | cut -c 1)
  set btLineN $btLineN',+1p' 
  set wifiLineN (rfkill list | grep -n 'phy0' | cut -c 1)
  set wifiLineN $wifiLineN',+1p' 

    #Con variables de nº linea cortar con sed las lineas y procesarlas con tr.
  set bt (rfkill list | sed -n $btLineN | tr -d [:blank:] | tr -d '\n' | cut -z -c 1,22-31,43-)
  set wifi (rfkill list | sed -n $wifiLineN | tr -d [:blank:] | tr -d '\n'| cut -z -c 1,7-15,30-) 

   #meter en var seleccion de dmenu 
  #set seleccion (echo -e $bt '\n' $wifi | dmenu)
  set seleccion (echo -se $bt'\n'$wifi | dmenu -nf red -sb green -sf red -fn 12)
  
    #activar/desactivar en funcion de la seleccion
  if echo $seleccion | grep -e 'no'
    set numNo (echo $seleccion | cut -c 1)
    rfkill block (echo $numNo)
    echo 'BLOQUEADO'
  
  else if echo $seleccion | grep -e 'yes'
    set numYes (echo $seleccion | cut -c 1)
    rfkill unblock (echo $numYes)
    echo 'DESBLOQUEADO'

  else
    echo 'ESCAPE O EXCEPCIÓN INCONTROLADA'
  end

end #function
