#! /bin/bash 

# Check the inputted arguments for a valid interger. Exit and alert if not.  

if [[  ! $1 =~ ^[-+]?[0-9]+$ ]] || [[ ! $2 =~ ^[-+]?[0-9]+$ ]]; then 

 echo "ERROR: One of the inputted values was not an integer. Good Bye" 

exit 1 

fi 

integer_one=$1 

integer_two=$2 

# Compute The Sum 

sum=$(( integer_one + integer_two )) 

# Compute The Difference 

diff=$(( integer_one - integer_two )) 

#Compute The Product 

product=$(( integer_one * integer_two )) 

#Compute The Quotient 

quotient=$(( integer_one / integer_two )) 

#Echo The Results 

echo "${integer_one} + ${integer_two} = ${sum}" 

echo "${integer_one} + ${integer_two} = ${diff}" 

echo "${integer_one} * ${integer_two} = ${product}" 

echo "${integer_one} / ${integer_two} = ${quotient}" 

exit 0 

_ 

 
 

 
