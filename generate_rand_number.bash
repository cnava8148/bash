#! /bin/bash 

read -p "Enter an integer between 0 and 15(inclusive): " input 

#Generate random number 

winner=$((RANDOM%15)) 

#Test if user guessed correctly 

if (( $winner == $input )); then 

   echo "Congratulations, you guessed correctly." 

else 

   echo "$input is not the correct answer. The correct answer was $winner." 

fi 

exit 0 

 
 

   
