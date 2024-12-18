#!/bin/bash

# Create the files with specific byte sizes
echo -n "ABCDE" > f1.txt    # 5 bytes
echo -n "ABCDEFGHIJ" > f2.txt  # 10 bytes
echo -n "1234567890123456" > f3.txt  # 16 bytes

KEY="00112233445566778899aabbccddeeff" 
IV="0102030405060708090a0b0c0d0e0f10"

openssl enc -aes-128-ecb -e -in f1.txt -out f1_ecb.bin -K $KEY
openssl enc -aes-128-ecb -e -in f2.txt -out f2_ecb.bin -K $KEY
openssl enc -aes-128-ecb -e -in f3.txt -out f3_ecb.bin -K $KEY

openssl enc -aes-128-cbc -e -in f1.txt -out f1_cbc.bin -K $KEY -iv $IV
openssl enc -aes-128-cbc -e -in f2.txt -out f2_cbc.bin -K $KEY -iv $IV
openssl enc -aes-128-cbc -e -in f3.txt -out f3_cbc.bin -K $KEY -iv $IV

openssl enc -aes-128-cfb -e -in f1.txt -out f1_cfb.bin -K $KEY -iv $IV
openssl enc -aes-128-cfb -e -in f2.txt -out f2_cfb.bin -K $KEY -iv $IV
openssl enc -aes-128-cfb -e -in f3.txt -out f3_cfb.bin -K $KEY -iv $IV

openssl enc -aes-128-ofb -e -in f1.txt -out f1_ofb.bin -K $KEY -iv $IV
openssl enc -aes-128-ofb -e -in f2.txt -out f2_ofb.bin -K $KEY -iv $IV
openssl enc -aes-128-ofb -e -in f3.txt -out f3_ofb.bin -K $KEY -iv $IV

echo "Encrypted file sizes:"
du -b f1_ecb.bin f2_ecb.bin f3_ecb.bin
du -b f1_cbc.bin f2_cbc.bin f3_cbc.bin
du -b f1_cfb.bin f2_cfb.bin f3_cfb.bin
du -b f1_ofb.bin f2_ofb.bin f3_ofb.bin

echo -e "\nDecrypting files with -nopad to inspect padding"

openssl enc -aes-128-ecb -d -in f1_ecb.bin -out f1_decrypted_ecb.txt -K $KEY -nopad
openssl enc -aes-128-ecb -d -in f2_ecb.bin -out f2_decrypted_ecb.txt -K $KEY -nopad
openssl enc -aes-128-ecb -d -in f3_ecb.bin -out f3_decrypted_ecb.txt -K $KEY -nopad

openssl enc -aes-128-cbc -d -in f1_cbc.bin -out f1_decrypted_cbc.txt -K $KEY -iv $IV -nopad
openssl enc -aes-128-cbc -d -in f2_cbc.bin -out f2_decrypted_cbc.txt -K $KEY -iv $IV -nopad
openssl enc -aes-128-cbc -d -in f3_cbc.bin -out f3_decrypted_cbc.txt -K $KEY -iv $IV -nopad

openssl enc -aes-128-cfb -d -in f1_cfb.bin -out f1_decrypted_cfb.txt -K $KEY -iv $IV -nopad
openssl enc -aes-128-cfb -d -in f2_cfb.bin -out f2_decrypted_cfb.txt -K $KEY -iv $IV -nopad
openssl enc -aes-128-cfb -d -in f3_cfb.bin -out f3_decrypted_cfb.txt -K $KEY -iv $IV -nopad

openssl enc -aes-128-ofb -d -in f1_ofb.bin -out f1_decrypted_ofb.txt -K $KEY -iv $IV -nopad
openssl enc -aes-128-ofb -d -in f2_ofb.bin -out f2_decrypted_ofb.txt -K $KEY -iv $IV -nopad
openssl enc -aes-128-ofb -d -in f3_ofb.bin -out f3_decrypted_ofb.txt -K $KEY -iv $IV -nopad

echo -e "\nHexdump of decrypted files (to view padding):"

hexdump -C f1_decrypted_ecb.txt
hexdump -C f2_decrypted_ecb.txt
hexdump -C f3_decrypted_ecb.txt
hexdump -C f1_decrypted_cbc.txt
hexdump -C f2_decrypted_cbc.txt
hexdump -C f3_decrypted_cbc.txt
hexdump -C f1_decrypted_cfb.txt
hexdump -C f2_decrypted_cfb.txt
hexdump -C f3_decrypted_cfb.txt
hexdump -C f1_decrypted_ofb.txt
hexdump -C f2_decrypted_ofb.txt
hexdump -C f3_decrypted_ofb.txt
