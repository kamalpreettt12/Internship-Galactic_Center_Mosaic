#!/bin/bash
#Kamalpreet Kaur: s18kkaur@uni-bonn.de
#Isabella Rammala: irammala@mpifr-bonn.mpg.de


# Check if filename and title are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 filename title"
    exit 1
fi

filename=$1
title=$2

# To plot the uv coverage of the measurement set
shadems --xaxis U --yaxis V --colour-by ANTENNA1 --title $title  $filename
