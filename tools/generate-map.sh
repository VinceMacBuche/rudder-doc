#!/bin/sh

# Create temporary directory to build list of included files
[ ! -d temp ] && mkdir temp

# FIXME: we do twice almost the same thing ... to be reworked

FILE=temp/content.txt

echo "// Automatically generated list of content - do not edit" > $FILE

for entry in $(find $(dirname $0)/../*_* -name '*txt' | sort)
do
	echo "include::../$entry[]" >> $FILE
done

FILE=temp/glossary.txt

echo "// Automatically generated list of content - do not edit
//glossary
== Appendix: Glossary
" > $FILE

for entry in $(find $(dirname $0)/../glossary -name '*txt' | sort)
do
	echo "include::../$entry[]" >> $FILE
done

$(dirname $0)/images-resolution.sh
