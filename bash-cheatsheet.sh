### tr reads from stdin
### and replaces character-by-character
### unlike sed which operates on strings

# delete newlines
cat test.txt | tr -d '\n'

# replace newlines by a character
tr '\n' ' ' < test.txt

# delete all whitespace characters
cat test.txt | tr -d [:space:]


### what host/port $command connects to

# strace (trace child processes too!)
# -v (verbose), -f (trace forked processes), -e trace=network (trace only network syscalls)
export strace-out=strace.out
strace -v -f -e trace=network $command &> $strace-out
cat $strace-out | grep 'connect(' | grep INET
