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

              echo  "$line" >> forbidden.txt
              
                   
elif [ ${STATUS} = 301 ] || [ ${STATUS} = 302 ] || [ ${STATUS} = 300 ]
 
       then 

              echo  "$line" >> 300_301_302.txt
              


else

              echo "$line==>>$STATUS" >> other_st.txt
                   
     fi 

done 
                                                       chmod 777 other_st.txt
                                                       chmod 777 300_301_302.txt
                                                       chmod 777 forbidden.txt
                                                       chmod 777 200.txt


