#!/bin/bash
# menu008.sh
# Ver espacio disponible sistema de archivos
# Grupo 4 ASL
# 04/10/2023
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
   echo "                    1) Ver Espacio Disponible Sistemas de Archivos"
  echo "                    2) Menu Anterior"
   echo " "
   echo -n "                                    Ingrese su opcion: "
   read opcion
   case $opcion in
      1)
	 df -h | awk '/^\// {print $1"\t"$2"\t"$3}' | less;;
      2)
         exit;;
      *)
         echo "Opción Inválida..."
         sleep 2
   esac
 done
