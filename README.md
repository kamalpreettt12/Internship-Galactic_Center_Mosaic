The following scripts included in this repository are: 

1. montage.sh

This script uses the astronomical software MONTAGE to reporject the images to a common header and add them up in a mosaic. Please make sure that you have montage already downloaded in your system. 

In the terminal, run:


**./montage.sh <path/to/input_images> <path/to/weights> <output.fits>**


2. ragavi.sh

ragavi is a powerful tool to visualize the gain table solutions for the first generation calibration in radio interferomtery and imaging. In this script, we provide a script which will create all the necessary gain table plots for you to check after 1GC, and that too in only one run! 

To use the script, please make sure that you already have ragavi. If not, you can find the ways to install ragavi from: https://ragavi.readthedocs.io/en/latest/installation.html


In the terminal, run: 

**./ragavi.sh <path/to/delay_table> <path/to/bandpass_table> <path/to/gain_table> <path/to/fluxscale_table> <path/to/store/html_images> <path/to/store/png_images>**

If, the directories for html and png are not there, the script will create one at the mentioned location.

