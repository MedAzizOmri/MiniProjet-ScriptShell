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


function Compresser 
{
    find ~ -type f -size +100k | xargs gzip -k
    if [ $? -eq 0 ]
      then
         echo "        ";
	 echo "   $(ColorBlue 'Compression effectuee')" 
    else 
         echo "        ";
	 echo " $(ColorRed 'Compression echouee : Pas de fichier avec un taille > 100Ko')" 
    fi
}
