#!/bin/bash
# menu003.sh
# Copiar un Archivo
# Grupo 4 ASL
# 04/10/2023

hacecopia()
{
cp $archivoori $archivodes
echo " "
echo "Programa copiado..."
sleep 2
}

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
   echo "                            1) Copiar un Archivo"
   echo "                            2) Menu Anterior"
   echo " "
   echo -n "                                    Ingrese su opcion: "
   read opcion
   case $opcion in
      1)
         echo " "
         tput cup 12 0
         echo -n "Ingrese Nombre Archivo Origen (Path Completo) : "
         read archivoori
         if test -f $archivoori
           then
             tput cup 14 0
             echo -n "Ingrese Nombre Archivo Destino (Path Completo): "
             read archivodes
             if test -f $archivodes
               then
                 tput cup 16 0
                 echo -n "El archivo $archivodes ya Existe. Lo Sobreescribe? (S/N): "
                 read resp
                 case $resp in
                     S|s) hacecopia;;
                     *) echo "" >/dev/null
                 esac
               else
                 hacecopia
             fi
           else
             echo -n "No existe el archivo especificado. Presione ENTER para continuar"
             read enter
         fi;;
      2)
         exit;;
      *)
         echo "Opcion Invalida....."
         sleep 2
   esac
 done
