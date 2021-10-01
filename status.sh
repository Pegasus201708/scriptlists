#!/bin/bash

figlet STATUS CHECKING
input=$1

for line in $(cat $1)
do
  echo "$line"
STATUS=$(curl $line -k -s -o /dev/null -w "%{http_code}" )

echo ="$STATUS"




 
if [ ${STATUS} = 200 ]
   
    
   then
      
     echo  "$line" >> 200.txt
     
              

   elif [ ${STATUS} = 403 ] || [ ${STATUS} = 401 ]
 
       then 

              echo  "$line" >> ./$domain/$foldername/status/forbidden.txt
              
                   
elif [ ${STATUS} = 301 ] || [ ${STATUS} = 302 ] || [ ${STATUS} = 300 ]
 
       then 

              echo  "$line" >> ./$domain/$foldername/status/300_301_302.txt
              


else

              echo "$line==>>$STATUS" >> ./$domain/$foldername/status/other_st.txt
                   
     fi 

done 
                                                     

