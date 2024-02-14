#!/bin/bash
#Kamalpreet Kaur: s18kkaur@uni-bonn.de
#Isabella Rammala: irammala@mpifr-bonn.mpg.de


# Check if filename, number of fields and directory path are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 filename num_fields dir_path"
    exit 1
fi

filename=$1
num_fields=$2
dir_path=$3

# Create directory if it doesn't exist
mkdir -p $dir_path

# To plot the uv coverage of the measurement set
shadems --xaxis U --yaxis V --colour-by ANTENNA1 --png $dir_path/uv_coverage.png $filename

# Loop over the number of fields
for ((i=0;i<=num_fields;i++)); do
    # To plot the phase change with time for different fields for correlation XX
    shadems --xaxis TIME --yaxis DATA:phase:XX --field $i --colour-by ANTENNA1 --png $dir_path/phase_change_XX_field_$i.png $filename

    # To plot the phase change with time for different fields for correlation YY
    shadems --xaxis TIME --yaxis DATA:phase:YY --field $i --colour-by ANTENNA1 --png $dir_path/phase_change_YY_field_$i.png $filename
done

# Additional shadems command without --field and YY correlation
shadems --xaxis TIME --yaxis DATA:phase --colour-by ANTENNA1 --png $dir_path/phase_change.png $filename
