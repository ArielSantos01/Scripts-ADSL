#!/bin/bash
# menu001.sh
# Ver contenido de un directorio
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
   echo "                    1) Ver Contenido de un Directorio"
   echo "                    2) Menu Anterior"
   echo " "
   echo -n "                                    Ingrese su opcion: "
   read opcion

   case $opcion in
      1)
         echo " "
         tput cup 12 0
         echo -n "Ingrese nombre del directorio: "
         read directorio
         if test -d $directorio
           then
             tput cup 14 0
             ls -la $directorio|less
           else
             echo -n "No existe el directorio especificado. Presione ENTER para continuar"
             read enter
         fi;;
      2)
         exit;;
      *)
         echo "Opción Inválida..."
         sleep 2
   esac
 done
