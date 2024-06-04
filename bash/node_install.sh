#!/bin/bash

function finish() {
  # Your cleanup code here
  sudo rm -rf package *.tgz.* logs '#!'
}
trap finish EXIT
#trap finish SIGHUP

apt update
apt install -y nodejs npm curl net-tools
sleep 2

printf ""
printf "################ \n"
printf ""

# Read user input for log dir.
read -p "Set directory location for application log (absolute path): " LOG_DIRECTORY
if [ -d "${LOG_DIRECTORY}" ]; then
  printf "%s already exists\n" "${LOG_DIRECTORY}"
else
  mkdir -p "${LOG_DIRECTORY}"
  printf "A new log directory has been created at: %s\n" "${LOG_DIRECTORY}"
fi

# Display nodeJS and npm versions
node_version=$(node --version)
npm_version=$(npm --version)

printf "Node.JS version: %s\n" "${node_version}"
printf "NPM version: %s\n" "${npm_version}"

printf ""
printf "################ \n"
printf ""

# Create new user to run the application and make the user the owner of the log dir
NEW_USER=myapp 
useradd $NEW_USER -m
chown $NEW_USER -R $LOG_DIRECTORY


# Fetch the Node.JS project from s3 bucket
runuser -l $NEW_USER -c "wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"

# Extract the project archive to ./package folder
runuser -l $NEW_USER -c "tar zxvf ./bootcamp-node-envvars-project-1.0.0.tgz"

# start the nodejs application in the background, with all needed env vars with new user myapp
runuser -l $NEW_USER -c "
    export APP_ENV=dev && 
    export DB_PWD=mysecret && 
    export DB_USER=myuser && 
    export LOG_DIR=$LOG_DIRECTORY && 
    cd package && 
    npm install && 
    node server.js &"


# Display the Node.JS process that is running
# grep -v grep is used to exclude the line containing the grep command itself from the output.
# It is commonly used in pipelines to ensure that only the relevant processes are displayed, without including the grep process used to search for them.
ps aux | grep node | grep -v grep 

# netstat displays network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
# The -l option shows only listening sockets.
# The -t option restricts output to TCP connections.
# The -n option shows numerical addresses instead of resolving hostnames.
# The -p option shows the PID and name of the program to which each socket belongs.
netstat -ltnp | grep :3000


#finish 