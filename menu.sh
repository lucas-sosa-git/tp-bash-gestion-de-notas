#!/bin/bash

while true; do

echo "=========================="
echo "   Gestion de Notas       "
echo "=========================="
echo "1. Crear entorno y directorios"
echo "2. Procesar archivos(Background consolidar.sh &)"
echo "3. Mostrar listado ordenado por padron"
echo "4. Mostrar las 10 notas mas altas"
echo "5. Buscar informacion por padron"
echo "6. Salir"
echo "=========================="

read -p "Ingresar una opcion(1-6): " opcion

case $opcion in
	1) echo "Logica pendiente, crear entorno...";;
	2) echo "Logica pendiente, iniciar proceso en background...";;
	3) echo "Logica pendiente, ordenar padrones...";;
	4) echo "Logica pendiente, buscar alumno...";;
	5) echo "Logica pendiente, BUscar alumno...";;
	6) echo "Cerrando sistema..."
	   exit 0
	   ;;
	*) "ERROR, Ingresar un numero del 1 al 6 "
esac

sleep 2
echo ""
done
