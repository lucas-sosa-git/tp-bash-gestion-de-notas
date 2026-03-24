#!/bin/bash

while true; do
	for archivo in "$HOME/EPNro1/entrada"/*.txt; do
		if [[ -e "$archivo" ]]; then
			cat "$archivo" >> "$HOME/EPNro1/salida/$FILENAME.txt"
			mv "$archivo" "$HOME/EPNro1/procesado/"
		fi
	done
done

