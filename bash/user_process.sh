#!/bin/bash



read -p "Would you like sort the process by memory(m) or CPU(c)? " sort_by
read -p "How many results would you like to display? " lines


# user_processes=$(ps aux | grep ${USER})
# printf "user processes: %s\n" "${user_processes}"

if [ "${sort_by}" = "m" ]
then 
	ps aux --sort -%mem | grep "${USER}" | head -n "${lines}"
elif [ "${sort_by}" = "c" ]
then 
	ps aux --sort -%cpu | grep "${USER}" | head -n "${lines}"
else 
	printf "No input is provided. EXITing!!! \n"
fi
