#! /bin/bash 

 
 

read -p "Enter an integer: " integer 

# Test for a remaind of 0. If 0, the integer is even, ELSE, it's odd 

if ! (( $integer % 2 )) ; then 

   echo "$integer is an even number. " 

else 

   echo "$integer is an odd number. " 

fi 

 
 

 
 

exit 0 

 
 
