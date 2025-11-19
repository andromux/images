#!/bin/bash
red='\e[0;31m' # Red
grn='\e[0;32m' # Green
reset='\e[0m' # reset color
if [ ! -d ~/storage ]
then
     termux-setup-storage
fi	


if [ ! -f $PATH/chdman ]
then

	echo -e "${grn}Instalando dependencias...${reset}"

        pkg install -y x11-repo
        pkg install -y git build-essential lld sdl2 binutils
	pkg install -y figlet ruby
	sleep 2
	gem install lolcat
	clear
	echo -e "${grn}Clonando repo y compilandolo...${reset}"
	    
		wget https://github.com/Pipetto-crypto/mame/archive/refs/heads/termux-chdman.zip
	    unzip termux-chdman.zip
	    cd mame-termux-chdman
	    bash build-chdman.sh
fi
clear
figlet chd Convert | lolcat
echo "Traducido por Retired64 <- Youtube " | lolcat
echo -e "${grn}Donde estan tus juegos${reset}(${red}ruta absoluta${reset})"
echo "Ejemplo: /sdcard/MisJuegos/ " | lolcat
read -p "Ruta > " location
if [ ! -f $location/conversion.sh ]
then
	echo -e "${grn}Creando El nuevo formato${reset}${red}CHD:${reset}"
	touch $location/conversion.sh
	chmod a+rwx $location/conversion.sh
    echo 'for i in *.iso' >> $location/conversion.sh
    echo 'do' >> $location/conversion.sh
    echo '  chdman createcd -i "$i" -o "${i%.*}.chd"' >> $location/conversion.sh
    echo '  rm -vi "$i"' >> $location/conversion.sh
    echo 'done' >> $location/conversion.sh
fi
cd  $location
echo -e "${grn}Empezando la creacion de todos tus juegos${reset}"
bash conversion.sh
echo -e "${grn}Realizado, Saliendo...${reset}"
cd ~


