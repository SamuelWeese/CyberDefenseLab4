#!/bin/bash
yes "This is a test file. " | head -n 100 > test_file.txt
# So that it doesn't complain, and I test quickly
key=$(openssl rand -hex 16)
iv=$(openssl rand -hex 16)

openssl enc -aes-128-cbc -in test_file.txt -out encrypted_file.bin -K $key -iv $iv

echo "openssl enc -d -aes-128-cbc -in corrupted_file.bin -out decrypted_file.txt -K $key -iv $iv"
