#!/bin/bash


bold='\e[1m'
red='\e[0;91m'
green='\e[32m'
blue='\e[34m'
clear='\e[0m'


Bold()
{
   echo -e $bold$1$clear
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


function Version 
{
   echo "             "
   echo "          $(ColorGreen '2A8 PROJET 2')"
   echo "  $(ColorRed 'Med Aziz Omri')   $(ColorBlue 'Med Aziz Ayed')"
   echo "         $(Bold 'VERSION:1.0.0beta')"
}
