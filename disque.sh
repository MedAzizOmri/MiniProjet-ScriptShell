#!/bin/bash


source supprimer.sh
source compresser.sh
source show_usage.sh
source help.sh
source version.sh
source journal.sh
source liste.sh


# Color  Variables

red='\e[0;91m'
green='\e[32m'
blue='\e[34m'
cyan='\e[36m'
clear='\e[0m'
italic='\e[1'
purple='\e[35'



# Color Functions


Purple()
{
   echo -e $purple$1$clear
}

Italic()
{
   echo -e $italic$1$clear
}

ColorRed()
{
   echo -e $red$1$clear
}


ColorGreen()
{
   echo -e $green$1$clear
}

ColorBlue()
{
   echo -e $blue$1$clear
}

ColorCyan()
{
   echo -e $cyan$1$clear
}


# Menu graphique
function menug {
		 yad --list \
                 --title="M E N U" \
                 --center \
                 --text="Choisir un bouton :" \
                 --buttonlist \
                 --column="" \
                 --button="Help":1 \
                 --button="Menu Graphique":2 \
                 --button="Version":3 \
                 --button="Journal":4 \
                 --button="Compression":5 \
                 --button="Suppression":6 \
                 --button="Parcourir":7 \
                 --button="Liste":8 \
		 --button="Menu Textuel":9 \
                 --button="Exit":10 \
                            
   ans=$?

if [ $ans -eq 1 ]
then
#help
Help;
menug;

elif [ $ans -eq 2 ]
then
#menu graphique
menug;

elif [ $ans -eq 3 ]
then
#version
Version ;
menug;

elif [ $ans -eq 4 ]
then
Journal_supp;
menug;

elif [ $ans -eq 5 ]
then
Compresser;
menug;

elif [ $ans -eq 6 ]
then
#supprimer
Supprimer;
menug;

elif [ $ans -eq 7 ]
then
echo "-p";
menug;

elif [ $ans -eq 8 ]
then
#Liste taille > 100Ko
Liste_Sup;
menug;

elif [ $ans -eq 9 ]
then
#menu textuel
menu;

elif [ $ans -eq 10 ]
then
#exit
echo "   $(ColorBlue 'Exist Successfully')"
exit 0;
fi            
}
#Fin menu graphique



#Parcour
function Parcourir
{
    
      while (("$#"))
	do
	size=$(stat --format="%s" $#)
	echo $size
	shift
      done
    
}



#test argument
if [ $# -eq 0 ]
  then
    show_usage
    exit 1;
fi
#fin test argument



menu () 
{
echo -n "
		$(Purple ';5m M E N U')

$(ColorCyan ' -h)') $(Italic ';3m Afficher le guide (H E L P) détaillé') 
$(ColorCyan ' -g)') $(Italic ';3m Afficher un menu graphique')
$(ColorCyan ' -v)') $(Italic ';3m Afficher le nom et la version du code') 
$(ColorCyan ' -j)') $(Italic ';3m Afficher le fichier journal des fichiers supprimés')
$(ColorCyan ' -c)') $(Italic ';3m Compresser un fichier')
$(ColorCyan ' -s)') $(Italic ';3m Supprimer un fichier')
$(ColorCyan ' -p)') $(Italic ';3m Parcourir des fichiers pour supprimer ou compresser')
$(ColorCyan ' -l)') $(Italic ';3m Afficher la liste des fichiers de taille sup a 100Ko')
$(ColorCyan ' -m)') $(Italic ';3m Afficher un menu textuel')
$(ColorCyan ' -e)') $(Italic ';3m Quitter')
$(ColorBlue ' Choose an option:') "
read a </dev/tty

        case $a in
	        -h) #HELP 
			Help;
			menu;;

	        -g) #Menu graphique
			menug;;
			
	        -v) #Version 
			Version;
			menu;;

	        -j) #Fichier Journal
			Journal_supp;
			menu;;

	        -c) #Compresser 
			Compresser;
			menu;;

		-s) #Supprimer 
			Supprimer;
			menu;;

	        -p) #Parcourir 
			Parcourir;
			menu;;

	        -l) #Liste taille sup a 100Ko 
			Liste_Sup;
			menu;;

	        -m) #Menu textuel
			menu;;

		-e) #Exit
			echo "    ";
			echo "   $(ColorBlue 'Au revoir !')"
			exit 0;;

		 *) echo "   $(ColorRed 'Faux argument')"
			show_usage;
			exit 1;;
        esac
}



while getopts "hgvjcsplme:" OPTION; do
    case $OPTION in
    h)	#Help
	Help;
        menu;;

    g)  #Menu graphique
	menug;;

    v)  #Version
	Version;
        menu;;

    j)	#Journal
	Journal_supp;
        menu;;

    c)	#Compresser
	Compresser;
	menu;;

    s)	#Supprimer
	Supprimer;
	menu;;

    p)  #Parcourir
	menu;;

    l)  #Liste taille sup a 100Ko
	Liste_Sup;
	menu;;
	
    m)  #Menu textuel
	menu;;

    e)  #Exit
            exit 0 ;;
    
    *)	#Choix introuvable
        echo "    $(ColorRed 'Faux argument')"
	show_usage;
        exit 1 ;;
    esac
done





