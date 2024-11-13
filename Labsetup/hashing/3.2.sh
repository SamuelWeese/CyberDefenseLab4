#!/bin/bash


echo "This is a prefix file for collision generation." > prefix.txt

./md5collgen prefix.txt -o M.bin N.bin

echo "This is the suffix T." > suffix.txt

cat M.bin suffix.txt > M_T.bin
cat N.bin suffix.txt > N_T.bin

md5sum M_T.bin > M_T_hash.txt
md5sum N_T.bin > N_T_hash.txt

echo "MD5 hash of (M + T):"
cat M_T_hash.txt
echo "MD5 hash of (N + T):"
cat N_T_hash.txt

colordiff N_T_hash.txt M_T_hash.txt
