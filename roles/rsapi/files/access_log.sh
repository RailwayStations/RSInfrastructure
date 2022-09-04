#!/bin/bash

cat /var/log/apache2/fotouebersicht_access.log /var/log/apache2/fotouebersicht_access.log.1 > /tmp/api.log
for f in /var/log/apache2/fotouebersicht_access.log.*.gz ; do gunzip -c "$f" >> /tmp/api.log ; done

sed -i 's/.*"\(.*\) HTTP\/.*/\1/g' /tmp/api.log
sed -i 's/\/..\//\/*\//g' /tmp/api.log
sed -i 's/\([?|&][^=]*=\)[^&]*/\1/g' /tmp/api.log
sed -i 's/\/Z\?[0-9].*/\/*/g' /tmp/api.log
sed -i 's/\/[^\/]*.jpg/\/*/g' /tmp/api.log
sed -i 's/\/[^\/]*.png/\/*/g' /tmp/api.log
sed -i 's/\/\//\//g' /tmp/api.log
sed -i 's/Verification\/.*/Verification\/*/g' /tmp/api.log
sort --version-sort /tmp/api.log | uniq -c 
