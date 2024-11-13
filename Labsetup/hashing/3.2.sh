#!/bin/bash


echo "This is a prefix file for collision generation." > prefix.txt

./md5collgen prefix.txt -o M.hex N.hex

md5sum M.hex | awk '{print $1}' > M.hex.sum
md5sum N.hex | awk '{print $1}' > N.hex.sum

colordiff M.hex.sum N.hex.sum

echo "This is the suffix T." > suffix.txt

cat M.hex suffix.txt > M_T.hex
cat N.hex suffix.txt > N_T.hex

echo "Showing the binaries are different"
colordiff N_T.hex M_T.hex

echo "Showing the sums are the same"
md5sum M_T.hex | awk '{print $1}' > M.hex.sum
md5sum N_T.hex | awk '{print $1}' > N.hex.sum

cat M.hex.sum
cat N.hex.sum

colordiff M.hex.sum N.hex.sum
