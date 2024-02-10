#!/bin/bash
#Kamalpreet Kaur: s18kkaur@uni-bonn.de
#Isabella Rammala: irammala@mpifr-bonn.mpg.de

# Get the directories and output file name from the arguments
image_dir=$1
weight_dir=$2
output_file=$3

# Create image metadata table
mImgtbl $image_dir image_dir.tbl

# Create a FITS header template
mMakeHdr image_dir.tbl template.hdr

# Get the list of FITS files in the image directory
image_files=($image_dir/*.pbcor.fits)

# Reproject the images
for ((i=0; i<${#image_files[@]}; i++)); do
    image_file=${image_files[$i]}
    image_name=$(basename $image_file .pbcor.fits)
    weight_file=$weight_dir/${image_name}.wt.fits
    mkdir -p "projdir/$image_name"
    mProjectPP $image_file "projdir/$image_name" template.hdr -w $weight_file
done

# Create reprojected image metadata table
mImgtbl projdir/ reimages.tbl

# Coadd the reprojected images to create a mosaic
mAdd -p projdir/ reimages.tbl template.hdr $output_file
