#!/bin/bash

echo -e "\n\e[32m\e[1m/ INSTALLING FONTS /"
folder="/home/enzo/fonts-loader"
ttf_files=`find /home/${USER}/fonts-loader/ -name *.ttf`

#Cheking of directory fonts-loader exists
if [[ -d "$folder" ]]; then
	echo "$folder exists on your filesystem."
else
	echo -e "\n\e[32m\e[1m EXITING..."
	exit
fi

#Detecting font files to move
echo -e "\e[0m\e[36mFound following fonts in instalation folder :"
for fonts in $ttf_files; do
	if [[ ${#fonts} -gt 0 ]]; then
		echo -e "\e[0m $fonts"
	elif [[ ${#fonts} -le 0 ]]; then
		echo -e "\e[31m No fonts were found..."
	fi
done

#Moving our ttf files inside /.fonts
echo -e "\e[91mMoving fonts inside :\e[1m /home/${USER}/.fonts\e[39m"
for toMove in $ttf_files; do
	mv $toMove /home/${USER}/.fonts
done

# Rebuild font cache
#sudo fc-cache -f -v

echo -e "\n\e[32m\e[1mDONE !"
