#!/bin/bash


red='\e[0;91m'

ColorRed()
{
   echo -e $red$1$clear
}



function Journal_supp
{
    if [ -e fichier_supp.txt ]
     then
       echo "Les fichiers supprimés sont :"
       echo "       "
       cat fichier_supp.txt
    else 
       echo "   $(ColorRed 'Le fichier n existe pas')" 
    fi
}
