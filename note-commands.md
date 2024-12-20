echo -n "one line without new line" > ~/secret

grep -iE "pattern" file.txt
grep -v

sed 's/==.*//' requirements.txt > requirements2.txt

find /path/target -name "*.json" -exec md5sum {} +;

rsync -avz --exclude '.git/' --exclude '*.log' --exclude '*.ipynb'  /path/to/folder/  user@host:~/target/folder/

#### gdb
set print elements 0
