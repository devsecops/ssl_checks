#!/bin/sh

for i in `cat EXTERNAL`
do
   echo "\n----START "$i"----"
   ping -q -c4 "$i" > /dev/null

   if [ $? -eq 0 ]
      then
         echo | openssl s_client -connect "$i":443 2>/dev/null | openssl x509 -noout -dates
      else
         echo "     "$i" is not available"
   fi
   echo "----END "$i"----"
done > ssl_date_check.txt
