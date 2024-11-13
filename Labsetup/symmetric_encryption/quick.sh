word_list="3.txt"
input_file="ciphertext.txt"
while IFS= read -r word; do
  tr 'vii' "$word" < "$input_file" > "${word}.txt"
done < "$word_list"
