echo "Mounting the source code directory on the local machine into the running container."
echo "This will allow any changes made to the files on the host to be immediately reflected in the container."

docker container run \
  --detach \
  --publish 80:80 \
  --name linux_tweet_app \
  --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html \
  $DOCKERID/linux_tweet_app:1.0
  
echo "In this example we’ll use the --mount flag to mount the current directory on the host"
echo "into /usr/share/nginx/html inside the container."

echo "Be sure to run this command from within the linux_tweet_app directory on your Docker host."

cp index-new.html index.html

echo "The Git repo that you pulled earlier contains several different versions of an index.html file."
echo "You can manually run an ls command from within the ~/linux_tweet_app directory to see a"
echo "list of them. In this step we’ll replace index.html with index-new.html."

docker rm --force linux_tweet_app

echo "stop and remove current running container"

docker container run \
  --detach \
  --publish 80:80 \
  --name linux_tweet_app \
  $DOCKERID/linux_tweet_app:1.0
  
echo "returned to old version,just removed the mount"

echo "Now updating the Image and build new image 2.0"

docker image build --tag $DOCKERID/linux_tweet_app:2.0 .

docker container run \
 --detach \
 --publish 80:80 \
 --name linux_tweet_app \
 $DOCKERID/linux_tweet_app:2.0
 
echo "New version with oragnge is running: http://ip172-18-0-13-bfikrb2v9dig00ccjdi0-80.direct.labs.play-with-docker.com"

echo "List Image On docker host"
docker image ls -f reference="$DOCKERID/*"

echo "These images are only stored in your Docker hosts local repository. "
echo "Your Docker host will be deleted after the workshop. In this step we’ll push the images "
echo "to a public repository so you can run them from any Linux machine with Docker."

echo "Distribution is built into the Docker platform. You can build images locally and push "
echo "them to a public or private registry, making them available to other users. "
echo "Anyone with access can pull that image and run a container from it. "
echo "The behavior of the app in the container will be the same for everyone, "
echo "because the image contains the fully-configured app - the only requirements to run it are Linux and Docker."

echo "Docker Hub is the default public registry for Docker images."
docker login
docker image push $DOCKERID/linux_tweet_app:1.0
docker image push $DOCKERID/linux_tweet_app:2.0

echo "Images are availbale at : https://hub.docker.com/r/zircoar/"

echo "------------------------------------------------------------------------------"
echo "===========================End  of Basics ====================================="
