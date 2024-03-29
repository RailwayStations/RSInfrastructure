##/bin/bash

cat /var/log/apache2/fotouebersicht_access.log /var/log/apache2/fotouebersicht_access.log.1 > /tmp/api.log
for f in /var/log/apache2/fotouebersicht_access.log.*.gz ; do gunzip -c "$f" >> /tmp/api.log ; done


sed -i 's#.*"\(.*\) HTTP/.*#\1#g' /tmp/api.log
sed -i 's#photoStationById/../.*#photoStationById/*/*#g' /tmp/api.log
sed -i 's#photoStationsByCountry/..?#photoStationsByCountry/*?#g' /tmp/api.log
sed -i 's#photoStationsByCountry/..$#photoStationsByCountry/*#g' /tmp/api.log
sed -i 's#photoStationsByPhotographer/.*#photoStationsByPhotographer/*#g' /tmp/api.log
sed -i 's#photos/../.*#photos/*/*#g' /tmp/api.log
sed -i 's#/../photographers#/*/photographers#g' /tmp/api.log
sed -i 's#/../stations#/*/stations#g' /tmp/api.log
sed -i 's#/stations/[^?&]*/#/stations/*#g' /tmp/api.log
sed -i 's#/inbox/[0-9]*\.jpg#/inbox/*.jpg#g' /tmp/api.log
sed -i 's#/inbox/done/[0-9]*\.jpg#/inbox/done/*.jpg#g' /tmp/api.log
sed -i 's#/inbox/processed/[0-9]*\.jpg#/inbox/processed/*.jpg#g' /tmp/api.log
sed -i 's#/inbox/rejected/[0-9]*\.jpg#/inbox/rejected/*.jpg#g' /tmp/api.log
sed -i 's#/userInbox/[0-9]*#/userInbox/*#g' /tmp/api.log
sed -i 's#/../stats/*#/stats#g' /tmp/api.log
sed -i 's#\([?|&][^=]*=\)[^&]*#\1#g' /tmp/api.log
sed -i 's#//#/#g' /tmp/api.log
sed -i 's#Verification/.*#Verification/*#g' /tmp/api.log
sort --version-sort /tmp/api.log | uniq -c 

