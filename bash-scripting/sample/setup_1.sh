#!/bin/bash

echo "setting up server"


file_name=config.yaml

echo "using file $file_name to configure server"



config_dir=$1

if [ -d "$config_dir" ]
then 
	echo "listing all files inside config dir"
	file_cmd=$(ls config)
else 
	echo "no config directory found and hence creating one"
	mkdir config/

fi 

echo "result of file_cmd: $file_cmd"


user_group=$2
if [ "$user_group" == "client" ]
then 
	echo "configuring the server"
elif [ "$user_group" == "devops" ]
then
	echo "administering the server"
else 
	echo "wrong user group mentioned"
fi 
