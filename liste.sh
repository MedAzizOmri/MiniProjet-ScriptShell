#!/bin/bash



function Liste_Sup
{
    echo "Les fichiers qui ont la taille supérieur à 100Ko sont :"
    echo "        "
    find ~ -type f -size +100k
}
