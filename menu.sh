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
	0)
    echo "--- Iniciando Modo Debug ---"
            
    mkdir -p "$HOME/EPNro1"
    cp "./consolidar.sh" "$HOME/EPNro1/consolidar.sh"
    chmod +x "$HOME/EPNro1/consolidar.sh"
            
            
    mkdir -p "$HOME/EPNro1/entrada"
    echo -e "122332 Juan Lopez jlopez@fi.uba.ar 8" > "$HOME/EPNro1/entrada/alumno1.txt"
    echo -e "77542 Franco Lomba flomba@fi.uba.ar 10" > "$HOME/EPNro1/entrada/alumno2.txt"
    echo -e "100223 Juana Pola jpola@fi.uba.ar 4" > "$HOME/EPNro1/entrada/alumno3.txt"
            
    echo "Debug completado: Script movido y 3 alumnos creados en 'entrada'."
    ;;

	1)
	 echo "-----"
	 echo "Iniciando creacion del entorno..."
		# estructura de archivos
	 mkdir -p "$HOME/EPNro1/entrada"
	 mkdir -p "$HOME/EPNro1/salida"
	 mkdir -p "$HOME/EPNro1/procesado"

	 echo "Carpetas en $HOME/EPNro1 creadas con exito"
	 ;;

	2)
	echo "Ejecuccion del consolidar.sh ..."
	if [[ -z "$FILENAME" ]]; then
		echo "ejecutar export FILENAME=Notas.tx"
	else
		bash "$HOME/EPNro1/consolidar.sh" &
		echo "Proceso de background iniciado correctamente"
	fi
	;;

	3)
	echo "Listado ordenado por padron"
	cat $HOME/EPNro1/procesado/*.txt | sort -n
	;;

	4)
	echo "10 Notas mas altas"
	cat $HOME/EPNro1/procesado/*.txt | sort -k5 -nr | head -n 10
	;;

	5)
	echo "Buscar informacion por padron"
	read -p "Ingresar el numero de padron a buscar: " padron_in
	echo "Resultados para el padron: " $padron_in
	grep -w "$padron_in" $HOME/EPNro1/procesado/*.txt

	echo "=========================="
	;;
	6) 
	echo "Cerrando sistema..."
	if [[ "$1 == -d" ]]; then
		echo "Parametro -d detectado"
		rm -rf "$HOME/EPNro1"
		pkill -f "consolidar.sh"
	fi
	exit 0
	;;

	*) "ERROR, Ingresar un numero del 1 al 6 "
esac

sleep 2
echo ""
done
