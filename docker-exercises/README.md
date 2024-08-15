# Docker Exercises

## Step 1 - Create Docker Container

```
# start mysql container using docker
docker run -p 3306:3306 \
--name mysql \
-e MYSQL_ROOT_PASSWORD=rootpass \
-e MYSQL_DATABASE=team-member-projects \
-e MYSQL_USER=admin \
-e MYSQL_PASSWORD=adminpass \
-d mysql 

# create java jar file
gradle build

# set env vars in Terminal for the java application (these will read in DatabaseConfig.java)
export DB_USER=admin
export DB_PWD=adminpass
export DB_SERVER=localhost
export DB_NAME=team-member-projects

# start java application
java -jar build/libs/docker-exercises-project-1.0-SNAPSHOT.jar
```

## Start Mysql GUI container 

```
# start phpmyadmin container using the official image
docker run -p 8083:80 \
--name phpmyadmin \
--link mysql:db \
-d phpmyadmin/phpmyadmin

# access it in the browser on
localhost:8083

# login to phpmyadmin UI with either of 2 mysql user credentials:
* admin:adminpass
* root:rootpass

```

### Docker-compose 

```
version: '3'
services:
  mysql:
    image: mysql
    ports:
      - 3306:3306
    environment:
      - MYSQL_ROOT_PASSWORD=rootpass
      - MYSQL_DATABASE=team-member-projects
      - MYSQL_USER=admin    
      - MYSQL_PASSWORD=adminpass
    volumes:
    - mysql-data:/var/lib/mysql
    container_name: mysql
    command: mysqld
  phpmyadmin:
    image: phpmyadmin
    environment:
      - PMA_HOST=mysql
    ports:
      - 8083:80
    container_name: phpmyadmin
volumes:
  mysql-data:
    driver: local


```


### Docker volumes

The `volumes` section in your Docker Compose file is used to define and manage persistent storage for your containers. In the provided code, you're using a volume named `mysql-data` to store MySQL database files outside of the container, ensuring that the data persists even if the container is removed or recreated.

### Breakdown of the Volumes Section

```yaml
volumes:
  mysql-data:
    driver: local
```

### Explanation:

1. **Volume Definition:**
   ```yaml
   volumes:
     mysql-data:
       driver: local
   ```
   - **`volumes:`**: This is a top-level key that defines all volumes that can be used by services in this Docker Compose file.
   - **`mysql-data:`**: This defines a named volume called `mysql-data`.
   - **`driver: local`**: This specifies that the volume uses the `local` driver, which is the default driver in Docker. The `local` driver stores the data on the host machine where the Docker daemon is running.

2. **Volume Usage in the MySQL Service:**
   ```yaml
   services:
     mysql:
       ...
       volumes:
       - mysql-data:/var/lib/mysql
   ```
   - **`volumes:`**: Specifies the volumes that will be mounted into the container.
   - **`mysql-data:/var/lib/mysql`**: This mounts the `mysql-data` volume to the path `/var/lib/mysql` inside the MySQL container. The `/var/lib/mysql` directory is where MySQL stores its database files. By mounting the volume here, all MySQL data will be stored in the `mysql-data` volume on the host.

### What Type of Volume is This?

The volume defined here is a **Named Volume** with the **Local Driver**:

1. **Named Volume:**
   - The `mysql-data` volume is a named volume. Named volumes are managed by Docker and can be reused across different containers and services. They are not tied to any specific container and can persist data across container restarts and recreations.

2. **Local Driver:**
   - The `local` driver is the default driver for Docker volumes. It stores data in a directory on the host machine (typically under `/var/lib/docker/volumes/` on Linux systems), but the exact location can vary depending on the Docker setup.

### Why Use a Volume?

Using a volume like this provides several benefits:
- **Data Persistence:** Data stored in the volume will persist even if the MySQL container is deleted or re-created.
- **Isolation:** The data is isolated from the container's filesystem, making it easier to manage and backup.
- **Portability:** You can move or share the volume across different containers or services, even across different Docker Compose projects.

### Summary
- The `volumes` section defines a named volume `mysql-data` using the local driver.
- The volume is mounted to `/var/lib/mysql` inside the MySQL container to store database files.
- This setup ensures that MySQL data is persisted and isolated from the container's lifecycle, making it a robust way to manage persistent data in Docker.
