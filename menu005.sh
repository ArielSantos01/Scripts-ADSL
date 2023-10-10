#!/bin/bash
# menu002.sh
# Copiar Directorio a Cinta
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
       if test -d $directorio
         then
           echo "Ingrese la ruta donde está montada la cinta"
           read cinta
           if test -d $cinta
             then
               LOGFILE="/etc/log/logcopiadia/`date +%Y%m%d`.log"
		ARCHIVO="$cinta/copia`date +%Y%m%d`"
               find $directorio | cpio -ovcO $ARCHIVO 1>$LOGFILE 2>$LOGFILE
	       echo "Listo"
	       sleep 22
             else
               echo "No se encontró la cinta especificada. Presione ENTER para continuar."
	       read enter
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
