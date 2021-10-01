#!/bin/bash

#us for probed url

figlet xmlrpc_CHECKING

input=$1

for line in $(cat $1)

do
  echo "$line"
STATUS=$(curl $line/xmlrpc.php -k -s -o /dev/null -w "%{http_code}")
stat=$(curl --data "param1=value1&param2=value2"  $line/xmlrpc.php -k -s -o /dev/null -w "%{http_code}" )

echo ="$STATUS" 

if [ $STATUS = 405 ] && [ $stat = 200 ]
then
 echo "$(curl --data "param1=value1&param2=value2" -v $line/xmlrpc.php )" 

echo "$line" >> ./$domain/$foldername/xml_result.txt

 fi
done
 
