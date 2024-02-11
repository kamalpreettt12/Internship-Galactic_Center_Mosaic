#!/bin/bash
#Kamalpreet Kaur: s18kkaur@uni-bonn.de
#Isabella Rammala:irammala@mpifr-bonn.mpg.de 

# Assign command-line arguments to variables
path_k=$1
path_b=$2
path_g=$3
path_fluxscale=$4
html_path=$5
png_path=$6

# Create the directories if they do not exist
mkdir -p $html_path
mkdir -p $png_path

# To plot the delay calibration solutions
ragavi-gains -g K -t $path_k --xaxis antenna --htmlname=$html_path/delay_solutions.html --plotname=$png_path/delay_solutions.png

# To plot the bandpass calibration solutions for both amplitude and phase
ragavi-gains -g B -t $path_b --htmlname=$html_path/bandpass_solutions.html --plotname=$png_path/bandpass_solutions.png

# To plot the gain calibration solutions for both amplitude and phase
ragavi-gains -g G -t $path_g --htmlname=$html_path/gain_solutions.html --plotname=$png_path/gain_solutions.png

# To plot the scaled flux density
ragavi-gains -t $path_fluxscale -d a --htmlname=$html_path/fluxscale.html --plotname=$png_path/fluxscale.png
