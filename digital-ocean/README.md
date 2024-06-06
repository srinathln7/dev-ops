
## Execute as `root` user
   
```
    3  ssh root@<pub_ipv4_cloud_server>	
    4  apt update
    5  apt install openjdk-8-jre-headless
    6  clear
    7  ls
    8  java -jar java-react-example.jar
    9  java -jar java-react-example.jar & #run the server in detached mode so that you are able to execute other commands
   10  ps aux
   11  ps aux | grep java
   12  netstat
   13  apt install net-tools
   14  netst -lpnt
   15  netstat -lpnt
   16  clear
   17  ls
   18  adduser srinath # create new linux user `srinath`
   19  usermod -aG sudo srinath # add user `srinath` to `sudo` user group. 
   20  su - srinath # switch to user `srinath`
   21  exit # log out as user `srinath`
```

## Execute as a general Linux user

```
    # Add your ssh key into the remote ubuntu server through the following commands
    3. su -srinath		
    4  mkdir .ssh
    5  sudo vim .ssh/authorized_keys
    6  exit
    7. ssh srinath@<pub_ipv4_cloud_server> # login successful

```

## secure copy of artifacts

```
scp bootcamp-node-project-1.0.0.tgz root@<public_ipv4_addr>:/root

# example
scp bootcamp-node-project-1.0.0.tgz root@46.101.107.223:/root  # scp => secure copy
```
