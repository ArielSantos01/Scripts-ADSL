#!/bin/bash
# menu002.sh
# Ver contenido de un archivo
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
   echo "                      1) Ver Contenido de Archivo"
   echo "                      2) Ver Cantidad de Lineas del Archivo"
   echo "                      3) Menu Anterior"
   echo " "
   echo -n "                                    Ingrese su opcion: "
   read opcion
   case $opcion in
      1)
        echo " "
         tput cup 12 0
         echo -n "Ingrese Nombre Archivo (Path Completo): "
         read archivo
        if test -f $archivo
          then
             less $archivo
           else
             echo -n "No existe el archivo especificado. Presione ENTER para continuar"
             read enter
         fi;;
      2)
         echo " "
         tput cup 12 0
         echo -n "Ingrese Nombre Archivo (Path Completo): "
         read archivo
         if test -f $archivo
           then
              echo " "
              echo "Cantidad de Lineas: "
              wc -l $archivo
              echo " "
              echo -n "Presione ENTER para continuar"
              read enter
            else
              echo -n "No existe el archivo especificado. Presione ENTER para continuar"
              read enter
         fi;;
      3)
         exit;;
      *)
         echo "Opcion Invalida....."
         sleep 2
   esac
 done
