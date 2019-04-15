#! /bin/bash 

 
 

#Prompt information from user 

 
 

read -p "Enter Employee Name: " name 

read -p "Enter Hours Worked by $name: " hours_worked 

read -p "Enter Hourly Pay Rate For $name: " pay 

 
 

bonus_pay=$(( RANDOM%1000 )) 

 
 

if (( $hours_worked <= 40 )); then 

  pay=$(( $rate * $hours_worked )) + $bonus_pay 

  total=$(( $pay + $bonus_pay )) 

elif (( $hours <= 54 )); then 

  pay=$(( $rate * 40) + (( 2 * $rate) * ( $hours_worked - 40 ) )) + bonus_pay 

  total=$(( $pay + $bonus_pay )) 

else 

  pay=$(( $rate * 40) +(( $rate*2) * 14) + (( $rate * 3) * ( $hours_worked - 54) )) + $bon  us_pay 

  total=$(( $pay + $bonus_pay )) 

fi 

 
 

 
