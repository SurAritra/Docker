# We will be using some pre stagged git repository to start this lab.

echo "Source : https://training.play-with-docker.com/beginner-linux/"

echo "Cloning the github repositiry as given in the tutorial .." 

git clone https://github.com/dockersamples/linux_tweet_app

echo "Running some simple containers"
echo "1. Container can be used as single or a shell script file"
echo "2. Container can be used interactively ,similar was as we ssh into a remote server.
echo "3. Container can be run in background for long-running services like websites and databases.

echo "Below command runs a Alpine Linux Container"
echo "If the container does not exist in the local path it will be picked from docker libraries"

docker container run alpine hostname

echo "Docker ls command to show containers"
docker container ls --all

echo "An interactive ubuntu container and will work inside that container"
docker container run --interactive --tty --rm ubuntu bash

echo "--interactive says you want an interactive session."
echo "--tty allocates a pseudo-tty."
echo "--rm tells Docker to go ahead and remove the container when it’s done executing."
echo "We’re also telling the container to run bash as its main process (PID 1)."

echo "This command will take us in ubuntu linux shell"
echo "Can use command like |ls |ps aux|cat /etc/issue"

echo "exit will take out out the shell and will remove the container due to rm command used"

echo "once done go to mysql_container_basic."
