#!/bin/bash


echo "total_params: $#"
echo "all_params: [$*]"



for param in $* 
	do 
	 if [ -d "$param" ]
	 then 
		echo " listing all files  in the directory"
       		ls -l "$param"
	else 
 	echo "$param"
	fi	
	done 		



function score_sum {

	sum=0
	while true; do
    	# Read from the prompt until `q` is pressed and keep summing
    	read -p "enter the score: " score

    	if [ "$score" = "q" ]; then
        	break
    	fi

    	sum=$(($sum + $score))
    	echo "total_score: $sum"
	done
}


score_sum


function create_file() {

file_name=$1	
is_shell_script=$2

touch $file_name
echo "file $file_name created"

if [ "$is_shell_script" = true ]
then 
	chmod u+x $file_name
	echo "added execute_permission"
fi 

return 
}

create_file test.txt
create_file myfile.yaml
create_file myscript.sh true




function sum(){
	total=$(($1+$2))
	return $total	
}

sum 2 10

# captures value/result returned by the last command
result=$?


echo "sum of 2 and 10 is $result"



function remove_file() {
rm $1
echo "removed file $1"
}

remove_file test.txt
remove_file myfile.yaml
remove_file myscript.sh

