echo "Below command runs a mysql container"
echo "--detach will run the container in the background."
echo "--name will name it mydb."
echo "-e will use an environment variable to specify the root password (NOTE: This should never be done in production)."

docker container run \
  --detach \
  --name mydb \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  mysql:latest
 
 echo "If the process is running in backgroud we can do thers works"
 
docker container ls

docker container logs mydb

echo "Shows the mysql daemon"
docker container top mydb

echo "List the MySQL version using docker container exec"

docker exec -it mydb \
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --version
  
echo "SSH into mydb"
docker exec -it mydb sh

echo "Check version number from inside the dmdb container"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD --version

echo "press exit when done"
echo "Next in package_and_run_custom_app_basic"
