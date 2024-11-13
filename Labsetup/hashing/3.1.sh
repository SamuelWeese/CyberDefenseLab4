#!/bin/bash

echo "This is a test prefix that is not a multiple of 64 bytes." > prefix.txt

./md5collgen prefix.txt -o out1.bin out2.bin
echo "Showing hex diff between 1 and 2"
xxd out1.bin
xxd out2.bin

echo "Checking differences between out1.bin and out2.bin"
diff out1.bin out2.bin
echo "MD5 hash of out1.bin:"
md5sum out1.bin
echo "MD5 hash of out2.bin:"
md5sum out2.bin

echo "This isa 64-byte prefix filethat should exactly b 64 bytes long" > prefix64.txt

echo "Size check:"
wc -c prefix64.txt

./md5collgen prefix64.txt -o out1.bin out2.bin

echo "Checking differences between out1.bin and out2.bin"
diff out1.bin out2.bin
echo "MD5 hash of out1.bin:"
md5sum out1.bin
echo "MD5 hash of out2.bin:"
md5sum out2.bin

echo "Showing hex differences of the two files:"
xxd out1.bin 
xxd out2.bin


