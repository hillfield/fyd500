#!/usr/bin/env bash
ARCHIVENR=$(date +%Y%m%d)
DESTDIR="$PWD/archive-$ARCHIVENR"
mkdir "$DESTDIR"

find "$PWD" -type f -a -mtime +5 | while read -d $'\000' file
do
	gzip "$file"; mv "$file".gz "$DESTDIR"
	echo "$file archived"
done

