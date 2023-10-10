#!/bin/bash
# menu.sh
# Menu principal 
# Grupo 4 ASL
# 04/10/2023
#
PATH=$PATH:.
export PATH
umask 002
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
    echo "                      1) Ver Contenido de Directorio"
   echo "                      2) Ver Contenido de Archivo"
    echo "                      3) Copiar un Archivo"
    echo "                      4) Renombrar un Archivo"
    echo "                      5) Copiar Directorio a Cinta"
    echo "                      6) Modificar Contraseña de un Usuario"
    echo "                      7) Ver Ingresos de Usuario"
    echo "                      8) Ver Espacio Ocupado por Sistema de Archivos"
   echo "                      9) Salida"
    echo " "
    echo -n "                                    Ingrese su opcion: "
    read opcion
    case $opcion in
      1)
        ./menu001.sh;;
      2)
         ./menu002.sh;;
      3)
         ./menu003.sh;;
      4)
         ./menu004.sh;;
      5)
        ./menu005.sh;;
      6)
         ./menu006.sh;;
      7)
         ./menu007.sh;;
      8)
         ./menu008.sh;;
      9)
         exit;;
      *)
         echo "Opcion Invalida..."
         sleep 2
    esac
  done
