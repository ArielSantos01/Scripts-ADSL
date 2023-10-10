#!/bin/bash
# menu002.sh
# Copiar Directorio a Cinta
# Grupo 4 ASL
# 04/10/2023
#

copia(){
    LOGFILE="/etc/log/logcopiadia/$(date +%Y%m%d).log"

    if ! test -d /etc/log/logcopiadia
    then
      echo "No existe el directorio /etc/log/logcopiadia. Presione ENTER para continuar."
      read enter
      exit 1
    fi

    find "$1" | cpio -ovcO "$2" 1> "$LOGFILE" 2> "$LOGFILE"
      if [ $? -eq 0 ]
      then
        echo "Se realizó la copia exitosamente. Presione ENTER para continuar."
      else
        echo "La operación ha falado. Presione ENTER para continuar."
      fi
      read enter
}

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
   echo "                      1) Respaldar un Directorio"
   echo "                      2) Respaldar Múltiples Directorios"
   echo "                      3) Menu Anterior"
   echo " "
   echo -n "                                    Ingrese su opcion: "
   read opcion
   case $opcion in
     1)
       echo "Ingrese el nombre del directorio a respaldar (Path Completo)"
       read directorio
       if test -d "$directorio"
         then
	   echo "Ingrese el nombre del archivo destino al que se copiara (Path Completo)"
           read cinta
	   if test -f "$cinta"
	   then
	     echo "¿Desea sobreescribir el archivo? (S/N)"
	     read -d respuesta
	     case "$respuesta" in
	       S|s) copia "$directorio" "$cinta";;
	         *) exit 1;;
	     esac
           else  
	     copia "$directorio" "$cinta"
	   fi
          else 
	     echo -n "No existe el directorio especificado. Presione ENTER para continuar"
             read enter
       fi;;
     3)
       exit;;
     *)
       echo "Opción Inválida..."
       sleep 2
   esac
 done
