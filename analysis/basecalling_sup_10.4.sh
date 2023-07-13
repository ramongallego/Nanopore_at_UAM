#!/bin/bash

# A script to do the sup basecalling in this laptop
# usage bash basecalling_sup_10.4.sh <input_folder> <OUTPUT_FOLDER>

INPUT_FOLDER=${1}
#sudo chmod -R -v 777 "${INPUT_FOLDER}"
echo "${INPUT_FOLDER}"
OUTPUT_FOLDER=${2}
echo "${OUTPUT_FOLDER}"
mkdir "${OUTPUT_FOLDER}"

for barcode in "${INPUT_FOLDER}"/barcode* ; do
  bar="$(basename "${barcode}")"

  output_target="${OUTPUT_FOLDER}"/"${bar}"

  mkdir "${output_target}"

/home/mk1b/gpu_guppy/ont-guppy/bin/guppy_basecaller \
-i "${barcode}" \
 -c dna_r10.4.1_e8.2_400bps_sup.cfg   \
 -s "${output_target}" \
 --trim_adapters \
 --recursive --device "cuda:0" --chunks_per_runner 12

done
