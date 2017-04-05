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


### debug connection and SSL issues

# - does curl connect over http or https?
curl -v http://$host:$port
curl -v https://$host:$port

# does wget work for the same URL?
# if yes, upgrading curl and nss can help
wget http://$host:$port
wget https://$host:$port

# what certs does curl use?
curl -v https://$host:$port

# give certs to curl explictly
curl --cacert $ca.pem --key $key.pem --cert $cert.pem -v https://$host:$port

# what certs does the server we're trying to connect to send?
openssl s_client -showcerts -connect $HOST:$PORT

# inspect a cert (eg. check expiry date, check date on server, and check whether NTP is working correctly)
openssl x509 -in $cert.pem -text | grep 'After'
date
ntpstat

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

### firewalls
iptables -S
iptables -L -n -v  # won't show which interface the rules are configured for without -v
iptables -F  # flush filter table only
