#!/bin/bash

# Blowfish encryption/decryption with ECB mode
openssl enc -aes-128-cbc -e -in ../plaintext.txt -out ../encrypted_cbc.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -aes-128-cbc -d -in ../encrypted_bf_ecb.bin -out ../decrypted_cbc.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

openssl enc -aes-128-cfb -e -in ../plaintext.txt -out ../encrypted_bf_cbc.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -aes-128-cfb -d -in ../encrypted_bf_cbc.bin -out ../decrypted_bf_cbc.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

openssl enc -bf-ctr -e -in ../plaintext.txt -out ../encrypted_bf_ctr.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -bf-ctr -d -in ../encrypted_bf_ctr.bin -out ../decrypted_bf_ctr.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# Blowfish encryption/decryption with different modes
openssl enc -bf-cfb -e -in ../plaintext.txt -out ../encrypted_bf_cfb.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -bf-cfb -d -in ../encrypted_bf_cfb.bin -out ../decrypted_bf_cfb.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

openssl enc -bf-ofb -e -in ../plaintext.txt -out ../encrypted_bf_ofb.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -bf-ofb -d -in ../encrypted_bf_ofb.bin -out ../decrypted_bf_ofb.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

openssl enc -bf-cfb8 -e -in ../plaintext.txt -out ../encrypted_bf_cfb8.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -bf-cfb8 -d -in ../encrypted_bf_cfb8.bin -out ../decrypted_bf_cfb8.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708
