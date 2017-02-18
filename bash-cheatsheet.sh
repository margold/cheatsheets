### tr reads from stdin
### and replaces character-by-character
### unlike sed which operates on strings

# delete newlines
cat test.txt | tr -d '\n'

# replace newlines by a character
tr '\n' ' ' < test.txt

# delete all whitespace characters
cat test.txt | tr -d [:space:]

# if grep considers a file to be binary
# remove NUL character
cat file | tr -d '\000' | yourgrep
# or use -a (force grep to treat files as ASCII text)
grep -a


### what host/port $command connects to

# strace (trace child processes too!)
# -v (verbose), -f (trace forked processes), -e trace=network (trace only network syscalls)
export strace-out=strace.out
strace -v -f -e trace=network $command &> $strace-out
cat $strace-out | grep 'connect(' | grep INET


### debug connection issues
curl -v $URL

# if curl fails with SSL problem
openssl s_client -msg -connect $HOST:$PORT

# -i (select all internet network files), -n (don't convert network numbers to names)
lsof -i -n

# select all internet files that belong to processes owned by user `margold`
# -a (AND the list options instead of ORing them)
lsof -ai -umargold -n

# --inet and --inet6 (address families)
# -n (numeric), -p (pid and name of program to which the socket belongs)
netstat --inet --inet6 -np

# -t (tcp), -u (udp), -n (numeric), -a (both listening and non-listening sockets)
# -p (pid and name of program to which the socket belongs), -l (show only listening sockets)
netstat -tunapl


### disk and file issues
du -hs
du -h --max-depth=1

# show last modified date of file
stat $filename
