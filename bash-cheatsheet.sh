### tr reads from stdin
### and replaces

# delete newlines
cat test.txt | tr -d '\n'

# replace newlines by a character
tr '\n' ' ' < test.txt

# delete all whitespace characters
cat test.txt | tr -d [:space:]
