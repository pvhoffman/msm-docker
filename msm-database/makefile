# makefile for msm-database docker image and container

# image name
IMAGE_NAME=yellowmagic/msm-database

#container name
CONTAINER_NAME=msm-database

image:
	docker build -t $IMAGE_NAME .

container:
	docker run -d --rm --volumes-from msm-dbdata --name $CONTAINER_NAME $IMAGE_NAME

all: image container

clean:
	docker rmi $IMAGE_NAME
	docker rm $CONTAINER_NAME


