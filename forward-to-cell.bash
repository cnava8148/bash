#! /bin/bash 

read -p "Enter Your Phone Number: " phone 

echo "Make A Provider Selection:" 

echo "1) Alltel" 

echo "2) AT&T"  

echo "3) Boost Mobile" 

echo "4) Cricket" 

echo "5) Metro PCS" 

echo "6) Spring" 

echo "7) Straight Talk" 

echo "8) T-Mobile" 

echo "9) US Cellular" 

echo "10) Verizon" 

echo "11) Virign Mobile" 

echo "12) Not Listed" 

echo "" 

read -p "Enter the number selection of your wireless provider: " provider 

case $provider in 

  1) 

     addr=message.alltel.com 

     ;; 

  2) 

     addr=txt.att.net 

    ;; 

  3) 

      addr=myboostmobile.com 

      ;; 

  4) 

      addr=sms.mycricket.com 

      ;; 

  5) 

      addr=mymetropcs.com 

      ;; 

  6) 

      addr=messaging.sprintpcs.com 

      ;; 

  7) 

      addr=vtext.com 

      ;; 

  8) 

      addr=tmomail.net 

      ;; 

  9) 

      addr=email.uscc.net 

      ;; 

  10) 

 addr=vtext.com 

      ;; 

  11) 

      addr=test.wireless.alltel.com 

      ;; 

  *) 

     echo "Invalid Selection. Please make a valid selection. " 

     exit 1 

     ;; 

esac 

 
 

messages=0 

sent=0 

 
 

rm -rf /tmp/${USER}-*.mesg 

 
 

while read label contetns ; do 

  while [ $? -eq 0 -a "$label" == "From" ]; do 

     Urgent_Flag=0 

 
 

     while [ "$label $contents" != " " ]; do 

           case "$label" in 

                                 

   " From") 

                       (( messages++ )) 

                      echo "$label $contents" >> /tmp/${USER}-${messages}.mesg 

                       ;; 

                "Date:") 

                      echo "$label $contents" >> /tmp/${USER}-${messages}.mesg 

                      ;; 

                "From:") 

                      echo "$label $contents" >> /tmp/${USER}-${messages}.mesg 

                      ;; 

                "To:") 

                      echo "$label $contents" >> /tmp/${USER}-${messages}.mesg 

                      ;; 

                "Subject:") 

                     echo "$label $contents" >> /tmp/${USER}-${messages}.mesg 

                      echo "$label $contents" | grep -q "URGENT" 

                      if [ $? -eq 0 ]; then 

                           Urgent_Flag=1 

                      fi 

                      ;; 

             * ) 

 
 

                      ;; 

           esac 

           read label contents 

     done 

 
 

     read label contents 

     while [ "$label $contents" != " " ]; do 

        echo "$label $contents" >> /tmp/${USER}-${messages}.mesg 

        read label contents 

  done 

 
 

  if [ ${Urgent_Flag} -eq 1 ]; then 

    cat /tmp/${USER}-${messages}.mesg | mail -s "URGENT Message" ${phone}@${addr} 

    (( sent++ )) 

  fi 

  done 

done < /var/spool/mail/$USER 
