echo "In this step you’ll learn how to package your own apps as Docker images using a Dockerfile."

echo "The Dockerfile syntax is straightforward. In this task, we’re going to create a simple NGINX website from a Dockerfile."

echo "Let's investigate the docker file which will build the website"
cd ~/linux_tweet_app
cat Dockerfile

echo "FROM specifies the base image to use as the starting point for this new image you’re creating."
echo "For this example we’re starting from nginx:latest."

echo "COPY copies files from the Docker host into the image, at a known location. In this example,"
echo "COPY is used to copy two files into the image: index.html. and a graphic that will be used on our webpage."

echo "EXPOSE documents which ports the application uses."

echo "CMD specifies what command to run when a container is started from the image."
echo "Notice that we can specify the command, as well as run-time arguments."

echo "Exporting environment variable with dockerid"
export DOCKERID=<your docker id>

echo "$DOCKERID"

echo "Use the docker image build command to create a new Docker image using the instructions in the Dockerfile."

docker image build --tag $DOCKERID/linux_tweet_app:1.0 .

echo "--tag allows us to give the image a custom name. In this case it’s comprised of our DockerID, "
echo "the application name, and a version. Having the Docker ID attached to the name will allow us to" 
echo "store it on Docker Hub in a later step"

echo ". tells Docker to use the current directory as the build context

echo "Let's start a container with the newly created image"
docker container run \
  --detach \
  --publish 80:80 \
  --name linux_tweet_app \
  $DOCKERID/linux_tweet_app:1.0
  

echo "As this container will be running an NGINX web server, we’ll use the 
echo "--publish flag to publish port 80 inside the container onto port 80 on the host. 
echo "This will allow traffic coming in to the Docker host on port 80 to be directed to port 80 in the container. 
echo "The format of the --publish flag is host_port:container_port.
echo "Any external traffic coming into the server on port 80 will now be directed into the container on port 80.

echo "In a later step you will see how to map traffic from two different ports - 
echo "this is necessary when two containers use the same port to communicate since 
echo "you can only expose the port once on the host.

echo "Website URL : http://ip172-18-0-19-bfihlss9cs9g00a582mg-80.direct.labs.play-with-docker.com"

echo "Command to stop and remove container "
echo "docker container rm --force linux_tweet_app"

echo "Next --> modify_running_website_basic"

