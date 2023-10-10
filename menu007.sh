#!/bin/bash
# menu007.sh
# Consultar ingresos de un Usuario
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
   echo "                            1) Consultar los Últimos Ingresos de un Usuario"        
   echo "                            2) Menu Anterior"
   echo " "
   echo -n "                                    Ingrese su opcion: "
   read opcion
   case $opcion in
      1)
	 echo " "
         tput cup 12 0
         echo -n "Ingrese Nombre del Usuario: "
         read usuario
         if cat /etc/passwd | grep -q "$usuario"
           then
	     clear
             last -n 10 "$usuario" | awk 'NR<=10 {print NR" - "$0}' | less
           else
             echo -n "El usuario no existe. Presione ENTER para continuar."
             read enter
         fi;;

      2)
         exit;;       
      *)
         echo "Opcion Invalida....."
         sleep 2
   esac
 done
