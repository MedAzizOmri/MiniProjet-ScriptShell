#!/bin/bash

blue='\e[34m'
red='\e[0;91m'

ColorRed()
{
   echo -e $red$1$clear
}

ColorBlue()
{
   echo -e $blue$1$clear
}


function Supprimer 
{
    touch fichier_supp.txt
    echo "~~~~ $(date +"%Y-%m-%d %H:%M") ~~~~" >> fichier_supp.txt
    find ~ -type f -size +100k >> fichier_supp.txt
    find ~ -type f -size +100k | xargs rm -r
    if [ $? -eq 0 ]
      then
         echo "        ";
	 echo "   $(ColorBlue 'Suppression effectuee')" 
    else 
         echo "        ";
	 echo " $(ColorRed 'Suppression echouee : Pas de fichier avec un taille > 100Ko')"
    fi
}
