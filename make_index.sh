#!/bin/bash

echo "<h1>홍기수 TIL 포트폴리오</h1>" > index.html
echo "<ul>" >> index.html

for file in *.md
do
    echo "<li><a href=\"$file\">$file</a></li>" >> index.html
done

echo "</ul>" >> index.html
