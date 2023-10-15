#!/bin/bash
# menu008.sh
# Consultar Espacio Ocupado FileSystems
# Grupo 4 ASL
# 09/10/2023
#

while :
 do
   clear 
   tput cup 1 0
   echo "Usuario: $LOGNAME"
   tput cup 1 25
   echo "Terminal: `tty`"
   tput cup 1 65 
   echo "Fecha: `date +%d/%m/%y`"
   tput cup 2 0
   echo "UTN FRM                                                                         "
   echo "ASL 2023                                                     Menu de Operaciones"
   echo " "
   echo "                            1) Ver el Espacio Ocupado por cada FileSystem"
   echo "                            2) Menu Anterior"
   echo " "
   echo -n "                                    Ingrese su opcion: "
   read opcion
   case $opcion in
      1) 
         echo " "
         tput cup 12 0
	 clear
         df -h | awk 'NR>1 {print $6"\t-\t"$3}' | less;;
	 
      2)
         exit;;       
      *)
         echo "Opcion Invalida....."
         sleep 2
   esac
 done
