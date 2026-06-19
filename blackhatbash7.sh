#!/usr/bin/env bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
#ps
ps | grep TTY
ps | grep -i tty
# -v
grep -v "35.237.4.214" log.txt
# -o
grep -o "35.237.4.214" log.txt
# awk
awk '{print $1}' log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt
# awk $NF
awk '{print $1,$NF}' log.txt
# csv
touch example_csv.txt
echo "hola1,chao1" > example_csv.txt
echo "hola2,chao2" >> example_csv.txt
echo "hola3,chao3" >> example_csv.txt
#awk csv
awk -F',' '{print $1}' example_csv.txt
head log.txt
awk 'NR < 10' log.txt
grep "42.236.10.117" log.txt
awk '{print $7}' log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'
#sed
sed 's/Mozilla/Godzilla/g' log.txt
grep "Mozilla" log.txt
grep "Godzilla" log.txt # does not work because sed only shows in the terminal 
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "Godzilla" newlog.txt
#sed and  delete
sed '1d' newlog.txt #only shows in the terminal 
sed -i '1d' newlog.txt
cat newlog.txt
git diff newlog.txt
sed '$d' newlog.txt
git diff newlog.txt
git diff newlog.txt | tail
sed 's/ //g' log.txt > newlog1.txt
cat newlog1.txt
sed '10,8d' newlog1.txt
#sed and print
sed -n '10,15 p' log.txt
#Managing the Background and Foreground
sleep 300 &
jobs
fg %1
bg %1
#nohup
chmo u+x exercise_solution.sh
nohup ./exercise_solution.sh 127.0.0.1 127.0.1.1 &
nohup ./exercise_solution.sh mysite nostarch.com &
ps -ef | grep exercise_solution.sh # Name of the file
ps aux | grep 11672 # Name of the process 