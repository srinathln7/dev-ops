#!/bin/sh


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

