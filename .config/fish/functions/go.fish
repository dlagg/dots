function go 
  #HOME , DAWPC , DAWUSB , I3 CONFIG , CONFIG , 
  #El dmenu centrado y selector en verde (bg-color) el texto en rojo
  set seleccion (echo -e '/home/dlag''\n''/home/dlag/DAW''\n''/mnt/sandisk''\n''/home/dlag/.config''\n''/home/dlag/.config/i3' | dmenu -nf red -sb green -sf red -fn 12)
  cd (echo $seleccion)
  cl

end #function
