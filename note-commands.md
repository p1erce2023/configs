echo -n "one line without new line" > ~/secret

grep -iE "pattern" file.txt
grep -v

sed 's/==.*//' requirements.txt > requirements2.txt

find /path/target -name "*.json" -exec md5sum {} +;

find /path/to/some/dir -type f -exec stat --format="%y %n" {} \; | sort -nr | head -n 1

rsync -avz --exclude '.git/' --exclude '*.log' --exclude '*.ipynb'  /path/to/folder/  user@host:~/target/folder/

#### gdb
set print elements 0
