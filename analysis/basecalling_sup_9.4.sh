#!/bin/bash

# A script to do the sup basecalling in this laptop
# usage bash basecalling_sup_9.4.sh <input_folder>

INPUT_FOLDER=${1}
#sudo chmod -R -v 777 "${INPUT_FOLDER}"
echo "${INPUT_FOLDER}"
OUTPUT_FOLDER="${INPUT_FOLDER}"/fastq_sup
echo "${OUTPUT_FOLDER}"
mkdir "${OUTPUT_FOLDER}"



/home/mk1b/gpu_guppy/ont-guppy/bin/guppy_basecaller \
-i "${INPUT_FOLDER}" \
 -c dna_r9.4.1_450bps_sup.cfg \
 -s "${OUTPUT_FOLDER}" \
  --recursive --device cuda:0 --chunks_per_runner 24
