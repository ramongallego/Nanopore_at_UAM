#!/bin/bash

# A script to do the sup basecalling in this laptop
# usage bash basecalling_sup_10.4.sh <input_folder> <OUTPUT_FOLDER>

INPUT_FOLDER=${1}
sudo chmod -R -v 777 "${INPUT_FOLDER}"
echo "${INPUT_FOLDER}"
OUTPUT_FOLDER=${2}
echo "${OUTPUT_FOLDER}"
mkdir "${OUTPUT_FOLDER}"



/home/mk1b/gpu_guppy/ont-guppy/bin/guppy_basecaller \
-i "${INPUT_FOLDER}" \
 -c dna_r10.4.1_e8.2_400bps_sup.cfg   \
 -s "${OUTPUT_FOLDER}" \
 --trim_adapters \
 --recursive --device "cuda:0" --chunks_per_runner 12
