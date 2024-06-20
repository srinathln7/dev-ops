# Nexus cmds executed in remote server

```
   15  wget https://download.sonatype.com/nexus/3/nexus-3.69.0-02-java8-unix.tar.gz
   16  ls
   17  tar -xzvf nexus-3.69.0-02-java8-unix.tar.gz 
   18  ls
   19  clear
   20  ls
   21  ls nexus-3.69.0-02
   22  ls
   23  adduser nexus
   24  ls -l 
   25  chown -R nexus:nexus nexus-3.69.0-02 sonatype-work/  # (user, group = nexus, nexus)
   26  ls -l
   29  vim nexus-3.69.0-02/bin/nexus.rc  # edit `runasuser:"nexus"`
   30  su - nexus
   32  usermod -aG sudo nexus # add user `nexus` to `sudo` group
```


## As `nexus` user

```
    1  /opt/nexus-3.69.0-02/bin/nexus start
    2  ps aux | grep nexus
    3  netstat -lnpt
    4  apt install net-tools
    5  exit
    6  su -nexus
    7  cat /opt/sonatype-work/nexus3/admin.password

```


## java-maven app

```
2004  pushd ~/.m2
 2005  ls
 2006  mv setings.xml settings.xml
 2007  ls
 2008  cat settings.xml
 2009  vim settings.xml 
 2010  popd
 2011  ls
 2012  cd ../java-maven-app/
 2013  ls
 2014  mvn package
 2015  ls
 2016  ls target/
 2017  cd ../
 2018  ls
 2019  cd java-maven-app/
 2020  ls
 2021  rm -rf target/
 2022  ls
 2023  mvn package
 2024  mvn deploy
 ```
 
 
 ```
 cat ~/.m2/settings.xml 

<settings>
	<servers>
		<server>
			<id>nexus-snapshots</id>
			<username>admin</username>
			<password>admin</password>
		</server>
	</servers>
</settings>
```

## REST APIs

```

export USER=<user_name>
export PWD=<pwd>

curl -u ${USER}:${PWD} -X GET 'http://157.230.121.207:8081/service/rest/v1/repositories'

curl -u ${USER}:${PWD} -X GET 'http://157.230.121.207:8081/service/rest/v1/components?repository=maven-snapshots'

```


## Publish Node.JS project

```
2007  npm login  --registry=http://159.223.17.75:8081/repository/npm-sample/  <Enter admin credentials>
2008  npm publish  --registry=http://159.223.17.75:8081/repository/npm-sample/ bootcamp-node-project-1.0.0.tgz



curl -u {user}:{password} -X GET 'http://159.223.17.75:8081/service/rest/v1/components?repository={npm-sample}&sort=version'

```
