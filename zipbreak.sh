#!/usr/bin/bash

echo "========================"
echo " [+]--  ZIP BREAK --[+]"
echo "========================"
echo ""

echo "-----------:: START ATTACK ::-----------"
sleep 3

for password in $(cat "$1");
do
  echo -n "Tentando senha: $password"

  unzip -P "$password" -o -q "$2" 2>/dev/null

  if [ $? -eq 0 ]; then
    echo -e "\n[+] Senha encontrada: $password"
    exit 0
  else
    echo -e "\r[!] Senha incorreta: $password"
  fi
done

echo "[-] Nenhuma senha na wordlist funcionou."
exit 1
