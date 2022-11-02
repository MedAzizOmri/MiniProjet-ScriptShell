#!/bin/bash


red='\e[0;91m'

ColorRed()
{
   echo -e $red$1$clear
}


function Help 
{
    if [ -e help.txt ]
     then
      cat help.txt
    else 
      echo "   $(ColorRed 'Le fichier n existe pas')" 
    fi
}
